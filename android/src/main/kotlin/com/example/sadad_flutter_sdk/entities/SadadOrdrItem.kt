package com.example.sadad_flutter_sdk.entities

import org.json.JSONObject


data class SadadOrdrItem(val name: String, val quantity: Int, val amount: Double) {
    constructor(json: JSONObject) : this(
        json["name"] as String,
        json["quantity"] as Int,
        json["amount"] as Double
    )
}