//
//  ViewController.swift
//  scissorPaperRock
//
//  Created by Bernice TSAI on 2020/9/4.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var choiceSegmentedControl: UISegmentedControl!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var computerLabel: UILabel!
    var chances: Int  = 3
    var winCount: Int = 0
    var lossCount: Int = 0
    var evenCount: Int = 0
    let punchesLabel: [String] = ["👊", "✌️", "👋"]
    func whoWins(computerChoice: Int){
        if playerLabel.text == punchesLabel[computerChoice]{
                evenCount += 1
                prizeLabel.isHidden = false
                prizeLabel.text = "\(winCount) 勝 \(lossCount) 負 \(evenCount) 和"
            }else if computerChoice != 0 {if  playerLabel.text == punchesLabel[computerChoice-1]{
                winCount += 1
                prizeLabel.isHidden = false
                prizeLabel.text = "\(winCount) 勝 \(lossCount) 負 \(evenCount) 和"
            }else{
                lossCount += 1
                prizeLabel.isHidden = false
                prizeLabel.text = "\(winCount) 勝 \(lossCount) 負 \(evenCount) 和"
            }
            }else{
                if playerLabel.text == punchesLabel[computerChoice+2]{
                    winCount += 1
                    prizeLabel.isHidden = false
                    prizeLabel.text = "\(winCount) 勝 \(lossCount) 負 \(evenCount) 和"
                }else{
                    lossCount += 1
                    prizeLabel.isHidden = false
                    prizeLabel.text = "\(winCount) 勝 \(lossCount) 負 \(evenCount) 和"
                }
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.isHidden = true
        countLabel.text = "第 \(4-chances) 局"
        // Do any additional setup after loading the view.
    }

    @IBAction func changeSegmentedControl(_ sender: Any) {
        if chances > 0 {
            countLabel.text = "第 \(4-chances) 局"
            computerLabel.text = "❓"
            let playerChoice = choiceSegmentedControl.selectedSegmentIndex
            switch playerChoice {
            case 0: // Rock
                playerLabel.text = punchesLabel[playerChoice]
            case 1:// Scissor
                playerLabel.text = punchesLabel[playerChoice]
            case 2: //Paper
                playerLabel.text = punchesLabel[playerChoice]
                
            default:
                return
            }
    }
    }
    
    @IBAction func battlePlay(_ sender: Any) {
        prizeLabel.isHidden = true
        if playerLabel.text != "❓"{
            if chances >= 1 {
                let computerChoice = Int.random(in: 0...2)
                computerLabel.text = punchesLabel[computerChoice]
                whoWins(computerChoice: computerChoice)
                countLabel.text = "第 \(4-chances) 局"
                if chances == 1{
                    countLabel.text = "第 \(4-chances) 局 結束"
                    clearButton.isHidden = false
                }
                chances -= 1
                
                    
        }else if chances == 0{
            //playButton.isEnabled = false
            //choiceSegmentedControl.isEnabled = false
            prizeLabel.isHidden = true
        }
        
            //let punchesLabel: [String] = ["👊", "✌️", "👋"]
        
    }
    }
    
    @IBAction func starOver(_ sender: UIButton) {
        computerLabel.text = "❓"
        playerLabel.text = "❓"
        chances  = 3
        countLabel.text = "第 \(4-chances) 局"
        winCount = 0
        lossCount = 0
        evenCount = 0
        choiceSegmentedControl.isEnabled = true
        prizeLabel.isHidden = true
        playButton.isEnabled = true
        playButton.isHidden = false
        clearButton.isHidden = true
    }
}


