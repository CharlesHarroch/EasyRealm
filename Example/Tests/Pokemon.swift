//
//  Pokemon.swift
//  EasyRealm
//
//  Created by Allan Vialatte on 10/03/2017.
//


import Foundation
import RealmSwift

<<<<<<< HEAD
@objcMembers final class Pokeball:Object {
    dynamic var identifier = UUID().uuidString
    dynamic var level = 1
    dynamic var branding = ""
=======
final class Pokeball:Object {
  @objc dynamic var identifier = UUID().uuidString
  @objc dynamic var level = 1
  @objc dynamic var branding = ""
>>>>>>> 0e5005ac0f92213f438a6ba8d7d53ce4d4457ecb
  
  override static func primaryKey() -> String? {
    return "identifier"
  }
  
  static func create() -> Pokeball {
    let ball = Pokeball()
    ball.level = Int(arc4random()) % 5
    return ball
  }
  
}

<<<<<<< HEAD
@objcMembers final class Pokemon: Object {
  dynamic var name: String?
  dynamic var level: Int = 1
  dynamic var pokeball:Pokeball?
=======
final class Pokemon: Object {
  @objc dynamic var name: String?
  @objc dynamic var level: Int = 1
  @objc dynamic var pokeball:Pokeball?
>>>>>>> 0e5005ac0f92213f438a6ba8d7d53ce4d4457ecb
  let specialBoost = RealmOptional<Int>()
  
  override static func primaryKey() -> String? {
    return "name"
  }
}
