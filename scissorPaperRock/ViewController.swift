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
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.isHidden = true
        countLabel.text = "第 \(4-chances) 局"
        // Do any additional setup after loading the view.
    }

    @IBAction func changeSegmentedControl(_ sender: Any) {
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
    
    @IBAction func battlePlay(_ sender: Any) {
        let computerChoice = Int.random(in: 0...2)
        computerLabel.text = punchesLabel[computerChoice]
        chances -= 1
        countLabel.text = "第 \(3-chances) 局"
        prizeLabel.isHidden = true
            //let punchesLabel: [String] = ["👊", "✌️", "👋"]
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
    if chances == 0{
            clearButton.isHidden = false
            choiceSegmentedControl.isEnabled = false
            prizeLabel.isHidden = false
            prizeLabel.text = "\(winCount) 勝 \(lossCount) 負 \(evenCount) 和"
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


