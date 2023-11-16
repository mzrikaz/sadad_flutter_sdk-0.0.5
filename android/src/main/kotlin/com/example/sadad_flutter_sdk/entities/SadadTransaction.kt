package com.example.sadad_flutter_sdk.entities

import org.json.JSONObject


data class SadadTransaction(
    val mobileNumber: String,
    val customerId: String,
    val clientToken: String,
    val orderId: String,
    val transactionAmount: String,
    val orderItems: List<SadadOrdrItem>
) {
    constructor(
        json: JSONObject,
        orderItems: List<SadadOrdrItem>
    ) : this(
        json["mobileNumber"] as String,
        json["customerId"] as String,
        json["clientToken"] as String,
        json["orderId"] as String,
        json["transactionAmount"] as String,
        orderItems
    )
}