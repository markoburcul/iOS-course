//
//  Result.swift
//  DZ1_IOS
//
//  Created by Marko Burčul on 28/03/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import Foundation

enum Result : Equatable {
    static func ==(lhs: Result, rhs: Result) -> Bool {
        switch(lhs,rhs){
        case(.win(Player.playerO),.win(Player.playerO)):
            return true
        case(.win(Player.playerX),.win(Player.playerX)):
            return true
        case(.tie,.tie):
            return true
        case(.nextMove, .nextMove):
            return true
        default:
            return false
        }
    }
    
    case win(Player)
    case tie
    case nextMove
}
