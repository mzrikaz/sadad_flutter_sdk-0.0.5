import Foundation
import SadadPaymentSDK

class SadadTransactionMapper{
    
    func prepare( sadadTransaction:SadadTransaction) -> SelectPaymentMethodVC{
        let podBundle = Bundle(for: SelectPaymentMethodVC.self)
        let storyboard = UIStoryboard(name: "mainStoryboard", bundle: podBundle)
        let vc = storyboard.instantiateViewController(withIdentifier: "SelectPaymentMethodVC")  as! SelectPaymentMethodVC
        vc.strMobile = sadadTransaction.mobileNumber
        vc.strEmail = sadadTransaction.email
        vc.isSandbox = false
        vc.strAccessToken = sadadTransaction.clientToken
        vc.amount = Double(sadadTransaction.transactionAmount)!
        let arrProduct:NSMutableArray = NSMutableArray()
        let productDIC = NSMutableDictionary()
        productDIC.setValue(sadadTransaction.orderItems[0].name, forKey: "itemname")
        productDIC.setValue(sadadTransaction.orderItems[0].quantity, forKey: "quantity")
        productDIC.setValue(sadadTransaction.orderItems[0].amount, forKey: "amount")
        arrProduct.add(productDIC)
        vc.arrProductDetails = arrProduct
        vc.modalPresentationStyle = .overCurrentContext
        return vc;
    }
}
