
import Foundation


class SadadOrderItem {
    let name: String;
    let quantity: Int;
    let amount: Double;
    init(dic:[String:Any]) {
        name = dic["name"] as! String;
        quantity = dic["quantity"] as! Int;
        amount = dic["amount"] as! Double;
    }
    
    static func getOrderItemsFromList(itemsInDic:Array<[String:Any]>) ->[SadadOrderItem]{
        var items = [SadadOrderItem]()
        for item in itemsInDic{
            let orderItem = SadadOrderItem(dic: item)
            items.append(orderItem)
        }
        return items
    }
}
