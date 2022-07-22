package com.example.new_test

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.*

import android.os.Looper.getMainLooper

class MainActivity: FlutterActivity() {
    private val CHANNEL ="com.example.new_test1"
    private val CHANNEL2="newactivity"
    private val evenChannel="com.example.new_test"
    private  lateinit var  channel : MethodChannel
    private lateinit var  channel2 : MethodChannel
    private  lateinit var  eventChannel1 : EventChannel
    lateinit var text:String
    var temp:String=" "
    var handler: Handler = Handler(Looper.getMainLooper())
    private var eventSink: EventChannel.EventSink? = null
    var callback: Runnable? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        //GeneratedPluginRegistrant.registerWith(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL)
        channel.setMethodCallHandler{
                call, result ->
            if(call.method=="GetBattery"){
                val intent = Intent(this, SecondActivity::class.java)
                text= call.argument<String>("BTN").toString()
                val text2= call.argument<String>("name").toString()

                intent.putExtra("name",text2)
                intent.putExtra("BTN",text)
                var battery=100
//                val intent2=getIntent()
//               battery= intent2.getIntExtra("Battery",battery)
                startActivityForResult(intent, 0)
                result.success(battery)
                //    Toast.makeText(this, "Done",Toast.LENGTH_LONG).show()
            }
        }

        channel2= MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL2)

        channel2.setMethodCallHandler { call, result ->
            if(call.method=="NewActivity"){

                //  Toast.makeText(this, "Done", Toast.LENGTH_LONG).show()
                val intent = Intent(this, SecondActivity::class.java)

            }


        }
        demoEventChannel()


    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 0) {
            if (resultCode == RESULT_OK) {
                // Get the result from intent
                val result = data?.getStringExtra("result")
                temp=result.toString()
                // set the result to the text view
//                findViewById<TextView>(R.id.textView).text = result
                demoEventChannel()
                Toast.makeText(this, result.toString(), Toast.LENGTH_LONG).show()
            }
        }
    }
    fun demoEventChannel() {


        EventChannel(flutterEngine!!.dartExecutor.binaryMessenger, evenChannel).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(args: Any?, events: EventChannel.EventSink?) {
                    //events?.success(true)
                    if (events != null) {
                        buildCallBack(events)?.let { handler.postDelayed(it, 1000) }
                    }
                }

                override fun onCancel(args: Any) {}
            }
        )
    }
    fun buildCallBack(events: EventChannel.EventSink): Runnable? {
        if (callback == null) {
            callback = Runnable {
                events.success(temp)
                callback?.let { handler.postDelayed(it, 1000) }
            }
        }
        return callback
    }
}
