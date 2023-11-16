import Flutter
import UIKit
import SadadPaymentSDK

typealias S = SadadPaymentSDK.SelectPaymentMethodVC;
let SADAD_CREATE_TRANSACTION = "sadad_create_transaction";

public class SwiftSadadFlutterSdkPlugin: NSObject, FlutterPlugin,SelectCardReponseDelegate {
    
    private var result:FlutterResult?;
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        self.result = result
        
        if(call.method == SADAD_CREATE_TRANSACTION){
            let sadadTransaction = ArgumentMapper().toSadadTransaction(arguments:call.arguments!)
            self.startSadadTransaction(sadadTransaction:  sadadTransaction);
        }
        
    }
    
    private func startSadadTransaction(sadadTransaction: SadadTransaction){
        let vc = SadadTransactionMapper().prepare(sadadTransaction: sadadTransaction);
        vc.delegate = self
        let navigationController = UINavigationController(rootViewController: vc)
        UIApplication.shared.keyWindow?.rootViewController?.present(navigationController, animated: true, completion: nil)
    }
    
    // callback to the response of Sadad SDk
    public func ResponseData(DataDIC: NSMutableDictionary) {
        DispatchQueue.main.async {
            SadadTransactionCallBackProcessor(onSuccess: { sadadResult in
                self.result?(sadadResult.transactionNumber)
                
            }, onFailed:{ sadadResult in
                self.result?(sadadResult.transactionNumber)
            }).onSadadResponse(DataDIC: DataDIC)
        }
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "sadad_flutter_sdk", binaryMessenger: registrar.messenger())
        let instance = SwiftSadadFlutterSdkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
}
