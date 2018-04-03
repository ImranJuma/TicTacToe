//
//  ViewController.swift
//  TicTacToe
//
//  Created by Imran Juma on 2018-03-28.
//  Copyright © 2018 Imran Juma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Here we have created a button to take us to another viewController where the user can get some more information on the game

    @IBAction func moreInformation(_ sender: Any) {
        performSegue(withIdentifier: "pageMoverLog", sender: self)
    }
    
    
    // Here I will have a second method that will take you to a new ViewController and outline the different adaptations that I have made for this project
    @IBAction func adaptationsButton(_ sender: Any) {
        
        // Here we will have the method that will take us to the next page
        performSegue(withIdentifier: "mySecondMethod", sender: self)
    }
    
    
    // Here we will poast the game winner banner
    @IBOutlet weak var winningMessage: UILabel!
    
    // Here if the user does not know how to play the game, we have an alert function that will teach them how to play
    
    @IBAction func howToPlay(_ sender: Any) {
        
        // Here is the text that will be displayed for my alert.
        let alert = UIAlertController(title: "Here Are The Instructions On How To Play The Game",message: "\n 1: Get A Friend \n \n 2: Decide Who Will Be 'X' & Who Will Be 'O' \n \n 3: Take Turn's placing 'X' and 'O' on the board, the first to reach 3 Across, Horizontal, Or Diagonal Wins!",preferredStyle: UIAlertControllerStyle.alert)
        
        // Here we have a dismiss button for the alert
        alert.addAction(UIAlertAction(title: "I understand, Take Me To The Game", style: UIAlertActionStyle.default, handler: nil))
        
        //Promp the alert when we hit the button
        self.present(alert, animated: true, completion: nil)
    }

    // Here we will have the functions for the restart game method
    @IBOutlet weak var restartGameButton: UIButton!
    
    // Here we wil =l reset all the varibles for when we want to restart our game, and allow for 9 new moves to be made
    @IBAction func restartGame(_ sender: Any) {
        
        // create the alert
        let alert = UIAlertController(title: "UIAlertController", message: "Are You Sure You Want To Restart The Game?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes Restart", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "No, I want to exit", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        winningMessage.text = "Welcome To COMP 2601 Tic-Tac-Toe"
        gameInProgress = true
        whosTurn = 1
        currentPosition = [0,0,0,0,0,0,0,0,0]
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
            }
        }
    }
    //  @IBAction func mainMenu(_ sender: Any) {
  //  }
    
    // Here we have created a varible that will double check to make sure the game is running, this will also be used to end the game, by setting the game's current state to false.
    var gameInProgress = true
    
    // Here we have a varible that will keep a log of who's turn it is, to currently play
    // The varible of 1 will be player 'O'
    // The varible of 2 will be player 'X'
    var whosTurn = 1
    
    // Here I am going to make an Array that will keept track of the games progress
    // This will be made in place so that Tge 'O' button cannot overtake another button
    // Meaning you cannot place an 'X' on top of an 'O' and vice cersa
    // The value of 1 will represent 'O'
    // The value of 2 will reprenset 'X'
    // We have 9 empty slots, so we have 9 different positions that can be played
    var currentPosition = [0,0,0,0,0,0,0,0,0]
    
    // Here we will store the winning turn, this will allow us to take a log of who has been winning in the games that we have been playing. This will be used by creating an array
    var winningMove = [
        [0,1,2], // First Top Row
        [3,4,5], // Second Row
        [6,7,8], // Third Bottom Row
        [0,3,6], // Vertical Down First Row
        [1,4,7], // Vertical Down Second Row
        [2,5,8], // Vertical Down Third Row
        [0,4,8], // Digonal Starting At 0, ending in 8
        [2,4,6], // Diagnoal Starting at 2, ending in 6
    ]

    // Using the sender function, and chnaging Any - to Any Object. I have been ablle to set a tag on each button
    // Button's 1-9 For Value 'O' That way we can take a note of when each button has been pressed.
    // This also allos us to only use one menthod for the whole game rather than having multiple to havea cleaner user envoirment 
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        // Here we have a print statement for debugging purposes
        print("The Collum", sender.tag, "Has Been Taken")
        
        // This will remove 1 possible position from the avalible positions that are useabke
        let positionTaken = sender.tag - 1
        
        // Here we are not only checking to see if the spot is avalible meaning, 1) There is a a box for the player to drop a value 2) that the game is still running 3) that there is not a current win.
        if currentPosition[positionTaken] == 0 && gameInProgress {
            
            // This will only allow you to make an 'X' or 'O' turn. Meaning if there is already an 'X' in position you cannot place an 'O', Same goes the other way
            currentPosition[positionTaken] = whosTurn
            
            // Here is the code for when it is player 'O' turn & changing to Player 'X' turn
            if whosTurn == 1 {
                
                
                // When the button is clicked, we will allow the O button to appear
                // Setting the array to a normal state using [] brackets
                sender.setImage(UIImage(named: "O.png"), for: [])
                
                // Once player 'O' Has Gone, it is player 'X' turn
                whosTurn = 2
                
            } else {
                
                // When the button is clicked, we will allow the X button to appear
                // Setting the array to a normal state using [] brackets
                sender.setImage(UIImage(named: "X.png"), for: [])
                
                // Once player 'X' Has Gone, it is player '0' turn
                whosTurn = 1
            }
            
            // Here we will check for a win, by going through a for loop
            for combination in winningMove {
                
                // Here we are checking the position of 0, and seeing if it mactches any of our combinations that we currently have as a 'winningMove'
                // The combination must result in [1,1,1] or [2,2,2] to result in a win as refrenced in lines 13 <-> 16
                // This would mean you have won with the player 'O' But Let's check if 'X' has a win as well -- This would mean you have won with the player 'X'
                if currentPosition[combination[0]] != 0 && currentPosition[combination[0]] == currentPosition[combination[1]] && currentPosition[combination[1]] == currentPosition[combination[2]] {
                    
                // Because the game has eneded, we must end the game progress, so that no player can make any more moves.
                    gameInProgress = false
                    
                    // Let player 1 know, that he has wone the game
                    // Let player 2 knowm that he has wone the game
                    if currentPosition[combination[0]] == 1 {
                        winningMessage.text = "Player 1 'O' Has Wone The Game"
                        let alert = UIAlertController(title: "Congratulations",
                                                      message: "Player 1 'O' Has Wone The Game",preferredStyle: UIAlertControllerStyle.alert)
                        
                        // Here we have a dismiss button for the alert
                        alert.addAction(UIAlertAction(title: "Take Me Back", style: UIAlertActionStyle.default, handler: nil))
                        
                        //Promp the alert when we hit the button
                        self.present(alert, animated: true, completion: nil)
                        
                    } else {
                        winningMessage.text = "Player 2 'X' Has Wone The Game"
                        let alert = UIAlertController(title: "Congratulations",
                                                      message: "Player 2 'X' Has Wone The Game",preferredStyle: UIAlertControllerStyle.alert)
                        
                        // Here we have a dismiss button for the alert
                        alert.addAction(UIAlertAction(title: "Take Me Back", style: UIAlertActionStyle.default, handler: nil))
                        
                        //Promp the alert when we hit the button
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    //Printoutputs used for debugging purposes
                    print("Player ",currentPosition[combination[0]], "Has Taken The Win For This Game")
                    print("Promt Play Again, Or End Game Message Now")
                    
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
