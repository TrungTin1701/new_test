package com.example.new_test

import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class SecondActivity :AppCompatActivity(){
//    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
//        super.onCreate(savedInstanceState, persistentState)
//
//        setContentView(R.layout.activity_second)
//
//    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)

        val data = 17
        fun returnResult(){
            val intent=Intent()
            intent.putExtra("data",data)
            setResult(RESULT_OK,intent)
            onBackPressed()
            finish()
        }
        var intent=getIntent()
       val Btnname=intent.getStringExtra("BTN")
        val TextVietName=intent.getStringExtra("name")
        findViewById<Button>(R.id.BtnNatoFlu).apply {
            text=Btnname.toString()
        }
        findViewById<TextView>(R.id.Name1).apply {
            text=TextVietName.toString()
        }


        var temp= findViewById<Button>(R.id.BtnNatoFlu)
        temp.setOnClickListener{

            Toast.makeText(this,"Nguyen Trung Tin ", Toast.LENGTH_LONG).show()
            returnResult()
        }

    }
}