package com.example.new_test

import android.content.Intent
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val CHANNEL ="com.example.new_test"
    private val CHANNEL2="newactivity"
    private  lateinit var  channel : MethodChannel
    private lateinit var  channel2 : MethodChannel
    lateinit var text:String
    var temp:Int = 0
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        //GeneratedPluginRegistrant.registerWith(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL)
        fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
            super.onActivityResult(requestCode, resultCode, data)
            if(requestCode==1){
                if(resultCode==RESULT_OK){
                    temp=data?.getIntExtra("data",temp)!!
                    channel.invokeMethod("com.example.new_test",text)
                }
            }
        }
        channel.setMethodCallHandler{
            call, result ->
            if(call.method=="GetBattery"){
                val intent = Intent(this, SecondActivity::class.java)
                text= call.argument<String>("BTN").toString()
                val text2= call.argument<String>("name").toString()

                intent.putExtra("name",text2)
                intent.putExtra("BTN",text)
                var battery=100
                val intent2=getIntent()
               battery= intent2.getIntExtra("Battery",battery)
                startActivity(intent)
               result.success(battery )
                Toast.makeText(this, "Done",Toast.LENGTH_LONG).show()
            }
        }
        channel2= MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL2)

        channel2.setMethodCallHandler { call, result ->
            if(call.method=="NewActivity"){

                Toast.makeText(this, "Done", Toast.LENGTH_LONG).show()
                val intent = Intent(this, SecondActivity::class.java)
// To pass any data to next activity
            //    intent.putExtra("keyIdentifier", "value")
// start your next activity
                startActivity(intent)
            }


        }
    }
}
