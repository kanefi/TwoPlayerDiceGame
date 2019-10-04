import UIKit

class TwoPlayerViewController: UIViewController {
    
    var togglePlayer = true
    var playerScore = 0
    var dice = [#imageLiteral(resourceName: "Kismet-Ace"),#imageLiteral(resourceName: "Kismet-Deuce"),#imageLiteral(resourceName: "Kismet-Trey"),#imageLiteral(resourceName: "Kismet-Four"),#imageLiteral(resourceName: "Kismet-Five"),#imageLiteral(resourceName: "Kismet-Six")]
    var randomDiceIndex: Int = 0
    var playerOneScore = 0
    var playerTwoScore = 0
    var scoreLabel = " "

    
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var scoreLabelPlayerOne: UILabel!
    @IBOutlet weak var scoreLabelPlayerTwo: UILabel!
    @IBOutlet weak var PlayerMessageLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: Any) {                               // click 'Roll'
       rollFunction()                                                           // rolls dice
        updatePlayerScore()                                                     // updates player scores
        updateMessage()
    }
    
    func rollFunction () {
        randomDiceIndex = Int.random(in: 0 ... 5)
        diceImage.image = dice[randomDiceIndex]
        print(randomDiceIndex)
    }

    func playerToggleFunction() {                                               // function to toggle between players
        if (togglePlayer) {
            print("Player One")
            togglePlayer = false
                          }
        else {
            print("Player Two")
            togglePlayer = true
             }
    }
    
    func updatePlayerScore() {                                                   // function to update player 1 or player 2 score
        if (togglePlayer == true) {
            playerOneScore += randomDiceIndex + 1
            scoreLabelPlayerOne.text = "\(playerOneScore)"
        }
        else {
            playerTwoScore += randomDiceIndex + 1
            scoreLabelPlayerTwo.text = "\(playerTwoScore)"
        }
    }
    
    func updateMessage() {                                                          // rolls dice and updates message on screen
        if (togglePlayer == true) {
            if  (randomDiceIndex == 0) {
                print ("Player One lost, Player Two's turn.")
                    PlayerMessageLabel.text = "Player One lost, Player Two's turn."
                    playerToggleFunction()
                    playerOneScore = 0
                    //updatePlayerScore()
                }
                
                else if (playerOneScore >= 21) {
                        print ("Player One won! Player Two's turn.")
                        PlayerMessageLabel.text = "Player One won! Player Two's turn."
                        playerToggleFunction()
                        playerOneScore = 0
                        //updatePlayerScore()

                    }
                else {
                        PlayerMessageLabel.text = " "
                        return
                     }
            }
        else {
            if  (randomDiceIndex == 0) {
                    print ("Player Two lost, Player One's turn.")
                    PlayerMessageLabel.text = "Player Two lost, Player One's turn."
                    playerTwoScore = 0
                    playerToggleFunction()
                }
                    
                else if (playerTwoScore >= 21) {
                    print ("Player Two won! Player One's turn.")
                    PlayerMessageLabel.text = "Player Two won! Player One's turn."
                    playerTwoScore = 0
                    playerToggleFunction()
                }
                else {
                    PlayerMessageLabel.text = " "
                    return
                }
        }
    }

        
    override func viewDidLoad() {
        super.viewDidLoad()
        }

}




// FUNCTIONING VERSION BUT DOESN'T UPDATE CHANGE PLAYER ONE AND PLAYER TWO SCORE BACK TO ZERO:

//
//  TwoPlayerViewController.swift
//  kismetDice
//
//  Created by codenation on 26/09/2019.
//  Copyright © 2019 Fiona. All rights reserved.
//

//import UIKit
//
//class TwoPlayerViewController: UIViewController {
//
//    var togglePlayer = true
//    var playerScore = 0
//    var dice = [#imageLiteral(resourceName: "Kismet-Ace"),#imageLiteral(resourceName: "Kismet-Deuce"),#imageLiteral(resourceName: "Kismet-Trey"),#imageLiteral(resourceName: "Kismet-Four"),#imageLiteral(resourceName: "Kismet-Five"),#imageLiteral(resourceName: "Kismet-Six")]
//    var randomDiceIndex: Int = 0
//    var playerOneScore = 0
//    var playerTwoScore = 0
//    var scoreLabel = " "
//
//    //
//
//    @IBOutlet weak var rollButton: UIButton!
//    @IBOutlet weak var diceImage: UIImageView!
//    @IBOutlet weak var scoreLabelPlayerOne: UILabel!
//    @IBOutlet weak var scoreLabelPlayerTwo: UILabel!
//    @IBOutlet weak var PlayerMessageLabel: UILabel!
//
//    //    @IBOutlet weak var messageLabel: UILabel!
//
//
//
//    @IBAction func playerToggleFunction() {
//        // Toggle between players, printed to console.
//        if (togglePlayer) {
//            print("Player One")
//            togglePlayer = false
//        }
//        else {
//            print("Player Two")
//            togglePlayer = true
//        }
//    }
//
//    @IBAction func rollFunction (_ sender: Any) {
//        randomDiceIndex = Int.random(in: 0 ... 5)
//        diceImage.image = dice[randomDiceIndex]
//        print(randomDiceIndex)
//        rollLogicFunction() // update below
//        updatePlayerScore()
//    }fbuto
//
//    // Now create a function to update each player's score
//
//
//    func updatePlayerScore() {
//        if (togglePlayer == true) {
//            rollLogicFunction()                 // Checks score and gives a message if reached 21, won or if scored 1 they have lost.
//            playerOneScore += randomDiceIndex + 1
//            scoreLabelPlayerOne.text = "\(playerOneScore)"          // Updates player one score.
//
//        }
//        else {
//            rollLogicFunction();
//            playerTwoScore += randomDiceIndex + 1
//            scoreLabelPlayerTwo.text = "\(playerTwoScore)"
//        }
//
//    }
//    // scoreLabelPlayerOne.text = "\(playerScore)"
//
//    func rollLogicFunction() {
//
//        if  (randomDiceIndex == 0) {
//            print ("You lose.")
//            PlayerMessageLabel.text = "You lost! Next player."              // Player lost game, toggle to next player.
//            playerScore = 0
//            playerToggleFunction()                                          //
//
//        }
//        else if (playerScore >= 21) {
//            print ("You've won.")
//            PlayerMessageLabel.text = "You've won!!!"
//            //            playerScore = 0
//            playerToggleFunction()
//        }
//        else {
//            PlayerMessageLabel.text = " "
//            return
//        }
//    }
//
//    //    Create a function to work out the first player to reach 21.
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//}
//
//

