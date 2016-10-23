

import Foundation
import RealmSwift

private var configToken: dispatch_once_t = 0

enum RealmConfig {

  case Main  //, Static

  var configuration: Realm.Configuration {
    switch self {
    case .Main:
      dispatch_once(&configToken) {

        Exams.copyInitialData(
          NSBundle.mainBundle().URLForResource("default", withExtension: "realm")!,
          to: RealmConfig.mainConfig.fileURL!)

      }
      return RealmConfig.mainConfig
  /*
    case .Static:
      return RealmConfig.staticConfig
 */
    }
  }

}
