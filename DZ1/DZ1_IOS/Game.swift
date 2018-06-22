//
//  File.swift
//  DZ1_IOS
//
//  Created by Marko Burčul on 28/03/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import Foundation
import Darwin



class Game {
    var result: Result?
    var gameTiles: [[TileState]]
    var currentPlayer: Player

    var noOfMoves:Int
    
    init() {
        gameTiles = [[TileState.empty,TileState.empty,TileState.empty],[TileState.empty,TileState.empty,TileState.empty],[TileState.empty,TileState.empty,TileState.empty]]
        noOfMoves = 0
        result = Result.nextMove
        currentPlayer = arc4random_uniform(2)==1 ? Player.playerX : Player.playerO
    }
    
    
    func nextMove(row: Int, col: Int)->Result{
        gameTiles[row][col] = TileState.occupied(currentPlayer)
        noOfMoves = noOfMoves + 1

        
        if(noOfMoves>4){
        for i in 0..<3{
            
            var counter = 0
            for j in 0..<3{
                if(gameTiles[j][i] == TileState.occupied(currentPlayer)){
                    counter = counter + 1
                }
                else{
                    counter = 0
                }
            }
            if(counter == 3){
                return Result.win(currentPlayer)
            }
        }
        
        for i in 0..<3{
            
            var counter = 0
            for j in 0..<3{
                if(gameTiles[i][j] == TileState.occupied(currentPlayer)){
                    counter = counter + 1
                }
                else{
                    counter = 0
                }
            }
            if(counter==3){
                return Result.win(currentPlayer)
            }
        }
        
        if((gameTiles[0][0]==gameTiles[1][1]) && (gameTiles[0][0]==gameTiles[2][2]) && (gameTiles[0][0] == TileState.occupied(currentPlayer))){
            return Result.win(currentPlayer)
        }
        if((gameTiles[0][2]==gameTiles[1][1]) && (gameTiles[0][2]==gameTiles[2][0]) && (gameTiles[0][2] == TileState.occupied(currentPlayer))){
            return Result.win(currentPlayer)
        }
        }
        
        if(noOfMoves==9){
            return Result.tie
        }
        
        
        currentPlayer = (currentPlayer == Player.playerX) ? Player.playerO: Player.playerX
        
        return Result.nextMove
    }
}



    
    

