
import Foundation


class SadadTransaction {
    let mobileNumber: String;
    let email: String;
    let customerId: String;
    let clientToken: String;
    let orderId: String;
    let transactionAmount: String;
    let orderItems: [SadadOrderItem]
    
    init(dic:[String:Any]) {
        mobileNumber = dic["mobileNumber"] as! String;
        email = dic["email"] as! String;
        customerId = dic["customerId"] as! String;
        clientToken = dic["clientToken"] as! String;
        orderId = dic["orderId"] as! String;
        transactionAmount = dic["transactionAmount"] as! String;
        let itemsInDic = dic["orderItems"] as! Array<[String:Any]>
        orderItems = SadadOrderItem.getOrderItemsFromList(itemsInDic:  itemsInDic);
    }
      
}
