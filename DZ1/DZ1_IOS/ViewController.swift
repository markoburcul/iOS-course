//
//  ViewController.swift
//  DZ1_IOS
//
//  Created by Marko Burčul on 28/03/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game:Game = Game()
    
    @IBOutlet weak var gameState: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet var boardButtons: [UIButton]!

    
    
    override func viewDidLoad() {
        for i in boardButtons{
            i.layer.cornerRadius = 5
        }
        resetButton.layer.cornerRadius = 5
    }
    
    @IBAction func titleButtonTap(sender: UIButton){

        sender.setTitle("\(game.currentPlayer==Player.playerO ? "O":"X")", for: UIControlState.normal)
        sender.isEnabled = false
        
        let tag = sender.tag
        let row = tag / 10 - 1
        let col = tag % 10 - 1
        
        let result = game.nextMove(row: row, col: col)
        
        if(result == Result.win(game.currentPlayer)){
            gameState.text = "Player \(game.currentPlayer.rawValue) has won!"
            for i in boardButtons{
                i.isEnabled = false
            }
        }
        else if(result == Result.tie){
            gameState.text = "It's a tie!"
        }
        else{
            gameState.text = "You're up player \(game.currentPlayer.rawValue) !"
        }
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        for i in boardButtons{
            i.setTitle("", for: UIControlState.normal)
            i.isEnabled = true
        }
        
        gameState.text = "New game"
        game = Game()
    }
    
}

