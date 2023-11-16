package com.example.sadad_flutter_sdk.entities

import android.util.Log
import com.example.sadad_flutter_sdk.entities.SadadTransactionResult
import com.example.sadad_flutter_sdk.entities.SadadTransactionResultStatus
import com.sadadsdk.listener.TransactionCallBack
import org.json.JSONObject


class SadadTransactionCallBackProcessor(
    private val onSuccess: (SadadTransactionResult) -> Unit,
    private val onFailed: (SadadTransactionResult) -> Unit
) : TransactionCallBack {
    override fun onTransactionResponse(inResponse: String?) {
        try {
            if (inResponse == null) throw Exception()
            val jsonObject = JSONObject(inResponse)
            if (jsonObject.has("data") && !jsonObject.isNull("data")) {
                Log.d("TAG_PAYMENT",jsonObject.toString())
                val dataJson = jsonObject.optJSONObject("data") ?: throw Exception()
                val transactionStatusId: Int =
                    if (!dataJson.isNull("transactionstatus")) {
                        dataJson.optInt("transactionstatus")
                    } else {
                        dataJson.optInt("transactionstatusId")
                    }
                val transactionNumber: String =
                    if (!dataJson.isNull("transactionnumber")) {
                        dataJson.optString("transactionnumber")
                    } else {
                        dataJson.optString("invoicenumber")
                    }
                // success case
                if (transactionStatusId == 3) {
                    val sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.Success,"Success",transactionNumber)
                    onSuccess(sadadTransactionResult)
                } else {
                    val sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.TransactionFailed,"Transaction Failed",transactionNumber)
                    onFailed(sadadTransactionResult)
                }
            } else {
                val sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.ApiField,"Failed to execute the transaction",null)
                onFailed(sadadTransactionResult)
            }
        } catch (e: Exception) {
            val sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.ApiField,"Not Knowing Exception Has been thrown",null)
            onFailed(sadadTransactionResult)
        }
    }

    override fun onTransactionFailed(errorJson: String?) {
        val sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.TransactionFailed,errorJson ?: "Sadad Callback",null)
        onFailed(sadadTransactionResult)
    }

    override fun onBackPressedCancelTransaction() {
        val sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.BackPressed, "User click on back pressed",null)
        onFailed(sadadTransactionResult)
    }

    override fun onTransactionCancel(errorJson: String?) {
        val sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.Canceled, "User cancel the transaction",null)
        onFailed(sadadTransactionResult)
    }
}