import Foundation

enum SadadTransactionResultStatus {
    case Success, ApiField, Canceled, BackPressed, TransactionFailed;
}

class SadadTransactionResult{
    let status: SadadTransactionResultStatus;
    let message: String;
    let transactionNumber: String?
    
    init(_ status: SadadTransactionResultStatus,_ message: String,_ transactionNumber: String?){
        self.status = status;
        self.message = message;
        self.transactionNumber = transactionNumber;
    }
}
