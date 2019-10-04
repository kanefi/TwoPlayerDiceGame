//
//  ViewController.swift
//  kismetDice
//
//  Created by codenation on 26/09/2019.
//  Copyright © 2019 Fiona. All rights reserved.
//

import UIKit
// importing SDK?
class ViewController: UIViewController {
// declaring class variables
    //MARK: Variables
    var playerScore = 0
    var dice = [#imageLiteral(resourceName: "Kismet-Ace"),#imageLiteral(resourceName: "Kismet-Deuce"),#imageLiteral(resourceName: "Kismet-Trey"),#imageLiteral(resourceName: "Kismet-Four"),#imageLiteral(resourceName: "Kismet-Five"),#imageLiteral(resourceName: "Kismet-Six")]       // images array, remember zero indexing
    //          0   1  2  3  4  5
    var randomDiceIndex: Int = 0
    var numberOfAttempts = 0
    var winTotal = 0
    var percentages = 0.00

    // for future, will definitely need current player
    
    
    //MARK: Outlets
    @IBOutlet weak var rollButton: UIButton!            //synchronising code to UI. Remember to drag from bullet point to physically link the code
    @IBOutlet weak var diceImage: UIImageView!          // Can be ! or ? Use ! for any
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
// weak - for more efficient memory - will get rid of what not using (for bigger applications than this!)
    
    
    //MARK: Functions
    @IBAction func rollFunction (_ sender: Any) {           // function
    // dice logic to be created below
        randomDiceIndex = Int.random(in: 0 ... 5)           //random number between 0 and 5 remember zero indexing
        diceImage.image = dice[randomDiceIndex]             // linking the image
        
        print(randomDiceIndex)
        playerScore += randomDiceIndex + 1                  // + 1 to 0...5 otherwise won't get a 6!
        scoreLabel.text = "\(playerScore)"
        rollLogicFunction()
    
    }
    
    func rollLogicFunction() {
        if (randomDiceIndex == 0) {                     // if statements for score roll and change message
            print ("You lose.")
            playerScore = 0
            messageLabel.text = "You loser!"
        }
        else if (playerScore >= 21) {
            print ("You've won.")
            messageLabel.text = "You've won!!!"
            playerScore = 0
            winTotal += 1
            print("Number of wins: \(winTotal)")
            }
        else {
            messageLabel.text = " "
            return
        }
        numberOfAttempts += 1
        print ("Number of attempts: \(numberOfAttempts)")
        let percentages = Double(winTotal)/Double(numberOfAttempts)
        let percentagesTwoDecimal = Double(round(100*percentages)/100)
        print("Attempt percentage: \(percentagesTwoDecimal)")

    }
    
//    func playerScore {
    //        if (togglePlayer) {
    
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollButton.setTitle("Roll here", for: .normal)     
        // Do any additional setup after loading the view.
    }
}

