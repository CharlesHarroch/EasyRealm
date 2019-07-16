//
//  Pokedex.swift
//  EasyRealm
//
//  Created by Allan Vialatte on 22/04/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import RealmSwift

<<<<<<< HEAD
@objcMembers final class Pokedex:Object {
    dynamic var identifier = UUID().uuidString
=======
final class Pokedex:Object {
  @objc dynamic var identifier = UUID().uuidString
>>>>>>> 0e5005ac0f92213f438a6ba8d7d53ce4d4457ecb
  
  override static func primaryKey() -> String? {
    return "identifier"
  }

}
