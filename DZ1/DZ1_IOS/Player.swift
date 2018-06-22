//
//  Player.swift
//  DZ1_IOS
//
//  Created by Marko Burčul on 01/04/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import Foundation


enum Player:String, Equatable {
    case playerX = "X"
    case playerO = "O"
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        
    switch(lhs,rhs){
        case( .playerX,  .playerX):
            return true
        case( .playerO, .playerO):
            return true
        default:
            return false
        }
    }
}
