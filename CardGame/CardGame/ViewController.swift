//
//  ViewController.swift
//  CardGame
//
//  Created by Danni Chen on 9/27/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1Img1: UIImageView!
    
    @IBOutlet weak var player1Img2: UIImageView!
    
    @IBOutlet weak var player1Img3: UIImageView!
    
    @IBOutlet weak var player2Img1: UIImageView!
    
    @IBOutlet weak var player2Img2: UIImageView!
    
    @IBOutlet weak var player2Img3: UIImageView!
    
    @IBOutlet weak var lblWinner: UILabel!
    
    let cards : [String] = ["AC", "AD", "AH", "AS",
                            "2C", "2D", "2H", "2S",
                            "3C", "3D", "3H", "3S",
                            "4C", "4D", "4H", "4S",
                            "5C", "5D", "5H", "5S",
                            "6C", "6D", "6H", "6S",
                            "7C", "7D", "7H", "7S",
                            "8C", "8D", "8H", "8S",
                            "9C", "9D", "9H", "9S",
                            "10C", "10D", "10H", "10S",
                            "JC", "JD", "JH", "JS",
                            "QC", "QD", "QH", "QS",
                            "KC", "KD", "KH", "KS"]
    let backs : [String] = ["blue_back", "gray_back","yellow_back","red_back","purple_back","green_back"]
    
    var setCards = [Int]()
    
    var winnerMsg = "Winner is: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.reset()
    }
    
    func shuffleCards(){
        self.lblWinner.text = "Winner is: "
        let numberOfCards = cards.capacity
        setCards = getRandomNumber(numberOfCards: numberOfCards)
        
        player1Img1.image = UIImage(named: cards[setCards[0]])
        player1Img2.image = UIImage(named: cards[setCards[1]])
        player1Img3.image = UIImage(named: cards[setCards[2]])
        player2Img1.image = UIImage(named: cards[setCards[3]])
        player2Img2.image = UIImage(named: cards[setCards[4]])
        player2Img3.image = UIImage(named: cards[setCards[5]])
        
    }
    
    func getRandomNumber(numberOfCards : Int) -> Array<Int>{
        var numbers : [Int] = [Int]()
        for i in 0 ..< 6{
            numbers.append(Int.random(in: 0 ..< numberOfCards))
        }
        return numbers
        
    }

    @IBAction func playGame(_ sender: UIButton) {
        self.shuffleCards()
        if cards[setCards[0]] == "AS" || cards[setCards[1]] == "AS" || cards[setCards[2]] == "AS" {
            self.winnerMsg = "Winner is: Player 1"
            self.lblWinner.text = winnerMsg
            self.playAgain(winner: winnerMsg)
        }else if cards[setCards[3]] == "AS" || cards[setCards[4]] == "AS" || cards[setCards[5]] == "AS" {
            self.winnerMsg = "Winner is: Player 2"
            self.lblWinner.text = winnerMsg
            self.playAgain(winner: winnerMsg)
        }else{
            self.winnerMsg = "No Winner"
            self.lblWinner.text = winnerMsg
        }
    }
    
    func playAgain(winner : String){
        let alert = UIAlertController(title: winner + ", Play Again?", message: "Do you want next round?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default, handler: { _ in self.nextRound()})
        let no = UIAlertAction(title: "No", style: .cancel, handler: { _ in self.reset()})
        alert.addAction(yes)
        alert.addAction(no)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func nextRound(){
        winnerMsg = "Winner is: "
        self.lblWinner.text = winnerMsg
        return
    }
    
    func reset(){
        player1Img1.image = UIImage(named: backs[0])
        player1Img2.image = UIImage(named: backs[1])
        player1Img3.image = UIImage(named: backs[2])
        player2Img1.image = UIImage(named: backs[3])
        player2Img2.image = UIImage(named: backs[4])
        player2Img3.image = UIImage(named: backs[5])
        self.lblWinner.text = "Winner is: "
        
    }
    
    
}

