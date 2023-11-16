package com.example.sadad_flutter_sdk.mappers

import com.example.sadad_flutter_sdk.entities.SadadOrdrItem
import com.example.sadad_flutter_sdk.entities.SadadTransaction
import org.json.JSONObject

class ArgumentsMapper {

    fun toSadadTransaction(arguments: Any) :SadadTransaction{
        val jsonObject = JSONObject(arguments.toString())
        val jsonArray = jsonObject.getJSONArray("orderItems")
        val orderItems = arrayListOf<SadadOrdrItem>()
        for (i in 0 until jsonArray.length()) {
            orderItems.add(SadadOrdrItem(jsonArray[i] as JSONObject))
        }
        return SadadTransaction(jsonObject, orderItems)
    }
}