import Foundation

class SadadTransactionCallBackProcessor{
    
    let onSuccess:(SadadTransactionResult)->();
    let onFailed:(SadadTransactionResult)->();
    
    init(onSuccess:@escaping (SadadTransactionResult)->(),onFailed:@escaping  (SadadTransactionResult)->()){
        self.onSuccess = onSuccess;
        self.onFailed = onFailed;
    }
    
     func onSadadResponse(DataDIC: NSMutableDictionary){
        var statusCode = 0
        let error = DataDIC.value(forKey: "error") as? NSDictionary
        if(error != nil){
            statusCode = error!.value(forKey: "statusCode") as! Int

        }else {
            statusCode = DataDIC.value(forKey: "statusCode") as! Int
        }
        if let transferResponse = DataDIC.value(forKey: "data") as? NSDictionary{
            let transectionSuccessfull = 3;
            if statusCode == 200 {
                var strTransectionID : String? = nil;
                if(transferResponse.value(forKey: "invoicenumber") != nil){
                    strTransectionID = transferResponse.value(forKey: "invoicenumber") as! String
                }else {
                    strTransectionID = transferResponse.value(forKey: "transactionnumber") as! String
                }
                if let transectionStatusID = transferResponse.value(forKey: "transactionstatus") as? Int{
                    if transectionStatusID != transectionSuccessfull{
                        let sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.TransactionFailed,"Transaction Failed",strTransectionID)
                        self.onFailed(sadadTransactionResult);

                    }
                }else if let status = transferResponse.value(forKey: "transactionstatusId") as? Int{
                    if status != transectionSuccessfull {
                        let sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.TransactionFailed,"Transaction Failed",strTransectionID)
                        self.onFailed(sadadTransactionResult);
                    }
                }else {
                    let sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.Success,"Success",strTransectionID)
                    self.onSuccess(sadadTransactionResult);
                }

            }else{
                let sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.ApiField,"Failed to execute the transaction",nil)
                self.onFailed(sadadTransactionResult);
            }
        }else{
            let sadadTransactionResult = SadadTransactionResult(SadadTransactionResultStatus.ApiField,"Failed to execute the transaction",nil)
            self.onFailed(sadadTransactionResult);
        }
    }
}
