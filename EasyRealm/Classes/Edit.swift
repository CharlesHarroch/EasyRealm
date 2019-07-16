//
//  ER_Edit.swift
//  Pods
//
//  Created by Allan Vialatte on 23/11/16.
//
//

import Foundation
import Realm
import RealmSwift

extension EasyRealm where T:Object {
    public func edit(withoutNotifying:[NotificationToken]? = nil, _ closure: @escaping (_ T:T) -> Void) throws {
        self.isManaged ? try managed_edit(withoutNotifying: withoutNotifying, closure) : try unmanaged_dit(closure)
    }
}

fileprivate extension EasyRealm where T:Object {

  func managed_edit(withoutNotifying:[NotificationToken]?, _ closure: @escaping (_ T:T) -> Void) throws {
    guard let rq = EasyRealmQueue() else { throw EasyRealmError.RealmQueueCantBeCreate }
    let ref = ThreadSafeReference(to: self.base)
    try rq.queue.sync {
      guard let object = rq.realm.resolve(ref) else { throw EasyRealmError.ObjectCantBeResolved }
        
        guard let notifications = withoutNotifying else {
            try rq.realm.write { closure(object) }
            return
        }
        
        rq.realm.beginWrite()
        closure(object)
        try rq.realm.commitWrite(withoutNotifying: notifications)
    }
  }
  
  func unmanaged_dit(_ closure: @escaping (_ T:T) -> Void) throws  {
    closure(self.base)
  }
}
