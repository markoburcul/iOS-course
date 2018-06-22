//
//  TileState.swift
//  DZ1_IOS
//
//  Created by Marko Burčul on 01/04/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import Foundation

enum TileState: Equatable {
    case occupied(Player)
    case empty
    
    static func ==(lhs: TileState, rhs: TileState) -> Bool {
        
        switch(lhs,rhs){
        case( .occupied(Player.playerX), occupied(Player.playerX)):
            return true
        case( .occupied(Player.playerO), occupied(Player.playerO)):
            return true
        case( .empty,  .empty):
            return true
        default:
            return false
        }
    }
}
