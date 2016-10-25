////////////////////////////////////////////////////////////////////////////
//
// Copyright 2016 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

import Foundation
import RealmSwift

// Private Helpers

private var realm: Realm! // FIXME: shouldn't have to hold on to the Realm here. https://github.com/realm/realm-sync/issues/694
private var deduplicationNotificationToken: NotificationToken! // FIXME: Remove once core supports ordered sets: https://github.com/realm/realm-core/issues/1206

private func setDefaultRealmConfigurationWithUser(user: SyncUser) {
    Realm.Configuration.defaultConfiguration = Realm.Configuration(
        syncConfiguration: (user, Constants.syncServerURL!),
        objectTypes: [product.self]
    )
    realm = try! Realm()
}



// Internal Functions

// returns true on success
func configureDefaultRealm() -> Bool {
    if let user = SyncUser.all().first {
        setDefaultRealmConfigurationWithUser(user: user)
        return true
    }
    return false
}

func authenticate(username: String, password: String, register: Bool, callback: (NSError?) -> ()) {
    SyncUser.authenticate(with: .usernamePassword(username: username, password: password, actions: register ? [.createAccount] : []), server: Constants.syncAuthURL as URL) { user, error in
        if let user = user {
            setDefaultRealmConfigurationWithUser(user: user)
        } else {
            print("error")
            
        }
        
    }
}

