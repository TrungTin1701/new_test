

import android.content.*
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        //EventChannel-1.[native side] Register with EventChannel.setStreamHandler
        EventChannel(flutterEngine.dartExecutor, CHARGING_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                private var chargingStateChangeReceiver: BroadcastReceiver? = null
                override fun onListen(arguments: Any, events: EventSink) {
                    //EventChannel-2.[native side] After EventChannel is initially completed, create and register the broadcast in the onListen callback of StreamHandler
                    chargingStateChangeReceiver = createChargingStateChangeReceiver(events) //Create
                    registerReceiver( //register
                        chargingStateChangeReceiver, IntentFilter(Intent.ACTION_BATTERY_CHANGED)
                    )
                }

                override fun onCancel(arguments: Any) {
                    unregisterReceiver(chargingStateChangeReceiver)
                    chargingStateChangeReceiver = null
                }
            }
        )
        //MethodChannel-1.[native side] Use MethodChannel.setMethodCallHandler to register the callback
        MethodChannel(
            flutterEngine.dartExecutor,
            BATTERY_CHANNEL
        ).setMethodCallHandler { call, result ->
            if ((call.method == "getBatteryLevel")) {
                val batteryLevel = batteryLevel
                if (batteryLevel != -1) {
                    //MethodChannel-3.[native side] Return value through Result.success
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun createChargingStateChangeReceiver(events: EventSink): BroadcastReceiver {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                    events.error("UNAVAILABLE", "Charging status unavailable", null)
                } else {
                    val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                            status == BatteryManager.BATTERY_STATUS_FULL
                    //EventChannel-4.[native side] Use EventSink.success to send messages
                    events.success(if (isCharging) "charging" else "discharging")
                }
            }
        }
    }

    private val batteryLevel: Int
        private get() = if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(
                null,
                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            )
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

    companion object {
        //The channel names used at both ends must be the same
        private const val BATTERY_CHANNEL = "samples.flutter.io/battery"
        private const val CHARGING_CHANNEL = "samples.flutter.io/charging"
    }
}