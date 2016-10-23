import Foundation
import RealmSwift

class order: Object {
  dynamic var order_id = ""
  let items = List<products>
}

class products: Object {
  dynamic var pid = 0
  dynamic var name = ""
  dynamic var price = 0
  dynamic var type = 0
}

class sales: Object {
  dynamic var name = ""
    dynamic var birthdate:NSDate
    dynamic var name = ""
  dynamic var price  = 0
}

