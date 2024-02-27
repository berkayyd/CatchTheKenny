//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Berkay Demir on 26.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //texts
    @IBOutlet weak var timeText: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var highScoreText: UILabel!
    
    //images
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    //variables
    var score = 0
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 10
    var kennyArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreText.text = "Score: \(score)"
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kenny1.addGestureRecognizer(gestureRecognizer1)
        kenny2.addGestureRecognizer(gestureRecognizer2)
        kenny3.addGestureRecognizer(gestureRecognizer3)
        kenny4.addGestureRecognizer(gestureRecognizer4)
        kenny5.addGestureRecognizer(gestureRecognizer5)
        kenny6.addGestureRecognizer(gestureRecognizer6)
        kenny7.addGestureRecognizer(gestureRecognizer7)
        kenny8.addGestureRecognizer(gestureRecognizer8)
        kenny9.addGestureRecognizer(gestureRecognizer9)
        
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func hideKenny() {
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
        let index = Int(arc4random_uniform(UInt32(kennyArray.count-1)))
        kennyArray[index].isHidden = false
    }

    @objc func increaseScore() {
        score += 1
        scoreText.text = "Score: \(score)"
    }
    
    @objc func countdown(){
        counter -= 1
        timeText.text = String(counter)
        
        if(counter == 0){
            timer.invalidate()
            hideTimer.invalidate()
            
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            let alert = UIAlertController(title: "Time's Up!", message: "Do you want to play again", preferredStyle: UIAlertController.Style.alert)
            let okBtn = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayBtn = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                //replay button
                self.counter = 10
                self.timeText.text = String(self.counter)
                self.score = 0
                self.scoreText.text = "Score : \(self.score)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okBtn)
            alert.addAction(replayBtn)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    


}

