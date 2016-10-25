import Foundation
import RealmSwift


class purchaseItem: Object {
    dynamic var pid = 0
    dynamic var amount = 0
    dynamic var type = 0
    dynamic var subtotal = 0
    
}


class order: Object {
  dynamic var order_id = NSUUID().uuidString
  let itemList = List<purchaseItem>()
  dynamic var date:NSDate!
  dynamic var total = 0

    
    
}

class product: Object {
  dynamic var pid = 0
  dynamic var name = ""
  dynamic var price = 0
  dynamic var type = 0

    
   static func all() -> Results<product> {
        let realm = try! Realm()
        return realm.objects(product)
    }
    
}

class daySale: Object {
  dynamic var date:NSDate!
  let orderList = List<order>()
  dynamic var total  = 0
}

class monthSales: Object {
    dynamic var name = ""
    let daySalesList = List<daySale>()
    dynamic var total  = 0
}
