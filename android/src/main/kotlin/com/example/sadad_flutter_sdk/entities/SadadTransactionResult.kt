package com.example.sadad_flutter_sdk.entities

enum class SadadTransactionResultStatus {
    Success, ApiField, Canceled, BackPressed, TransactionFailed;
}

data class SadadTransactionResult(
    val status: SadadTransactionResultStatus,
    val message: String,
    val transactionNumber: String?
);