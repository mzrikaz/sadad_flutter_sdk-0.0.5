package com.example.sadad_flutter_sdk

import android.app.Activity
import androidx.annotation.NonNull
import com.example.sadad_flutter_sdk.entities.SadadTransaction
import com.example.sadad_flutter_sdk.entities.SadadTransactionCallBackProcessor
import com.example.sadad_flutter_sdk.entities.SadadTransactionResult
import com.example.sadad_flutter_sdk.mappers.ArgumentsMapper
import com.example.sadad_flutter_sdk.mappers.SadadTransactionMapper
import com.sadadsdk.model.SadadOrder
import com.sadadsdk.paymentselection.SadadService
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

const val SADAD_CRATE_TRANSACTION = "sadad_create_transaction"

class SadadFlutterSdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private lateinit var activity: Activity

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result, methodName: String) {
        if (call.method == SADAD_CRATE_TRANSACTION) {
            val sadadTransaction = ArgumentsMapper().toSadadTransaction(call.arguments[0])
            startSadadTransaction(sadadTransaction, result, call.arguments[1])
        }
    }

    private fun startSadadTransaction(sadadTransaction: SadadTransaction, result: Result, methodName: String) {
        val bundle = SadadTransactionMapper().toBundle(sadadTransaction)
        try {
            val sadadOrder = SadadOrder()
            sadadOrder.requestParamMap = bundle
            SadadService.getProductionService()
            SadadService.createTransaction(
                activity,
                sadadOrder,
                SadadTransactionCallBackProcessor(
                    onSuccess = { sadadResult-> onSuccess(result, sadadResult) },
                    onFailed = { sadadResult -> onField(result, sadadResult) },
                ),
                methodName
            )
        } catch (e: Exception) {
            result.success(null)
        }
    }

    private fun onSuccess(result: Result, response: SadadTransactionResult) {
        result.success(response.transactionNumber)
    }

    private fun onField(result: Result, response: SadadTransactionResult) {
        result.success(response.transactionNumber)
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "sadad_flutter_sdk")
        channel.setMethodCallHandler(this)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onDetachedFromActivity() {
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

}
