

import Foundation
import RealmSwift


extension URL {
    static func inDocumentsFolder(fileName: String) -> URL {
        return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
            .appendingPathComponent(fileName)
    }
}

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block:(Void)->Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}


enum RealmConfig {
    
    private static let mainConfig = Realm.Configuration(
        fileURL: URL.inDocumentsFolder(fileName: "main.realm") ,
        schemaVersion: 1,
        objectTypes: [Product.self]
    )

  case Main  //, Static

  var configuration: Realm.Configuration {
    switch self {
    case .Main:
        DispatchQueue.once(token: "com.vectorform.test") {
            self.copyInitialData(
                from: Bundle.main.url(forResource: "default", withExtension: "realm")!,
                to: RealmConfig.mainConfig.fileURL!)
        }
        
      return RealmConfig.mainConfig
    }
  }
    
    func copyInitialData(from: URL, to fileURL: URL) {
        print("\(from.absoluteString) \(fileURL.absoluteString)")
        if !((fileURL as? NSURL)?.checkPromisedItemIsReachableAndReturnError(nil))! {
            _ = try? FileManager.default.removeItem(at: fileURL )
            try! FileManager.default.copyItem(at: from , to: fileURL )
        }
    }


}
