import Foundation
import RealmSwift


class PurchaseItem: Object {
    dynamic var product:Product?
    dynamic var amount = 0
    dynamic var type = 0
    dynamic var subtotal = 0
    
    
    func getSubtotal () -> Int {
        return product!.price * amount
    }
    
}


class Order: Object {
  dynamic var order_id = NSUUID().uuidString
  dynamic var name:String!
  let itemList = List<PurchaseItem>()
  dynamic var date:NSDate!
  dynamic var total = 0

    
    
}

class Product: Object {
  dynamic var pid = 0
  dynamic var name = ""
  dynamic var price = 0
  dynamic var type = 0
    
   static func all() -> Results<Product> {
        let realm = try! Realm()
        return realm.objects(Product.self)
    }
    
    
    
}

class DaySale: Object {
  dynamic var date:NSDate!
  let orderList = List<Order>()
  dynamic var total  = 0
}

class MonthSale: Object {
    dynamic var name = ""
    let daySalesList = List<DaySale>()
    dynamic var total  = 0
}
