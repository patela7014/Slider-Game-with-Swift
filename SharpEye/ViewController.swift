//
//  ViewController.swift
//  SharpEye
//
//  Created by Ankur Patel on 5/29/15.
//  Copyright (c) 2015 Ankur Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var currentValue:Int = 50
    var targetValue: Int = 0
    var score: Int = 0
    var scoreInRound: Int = 0
    var rounds: Int = 0
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func startNewRound(){
        
        rounds += 1
        
        currentValue = 50
        
        slider.value = Float(currentValue)
        
        targetValue = 1 + Int(arc4random_uniform(100))
        
        
        
    }
    
    func updateLabels(){
        
        targetLabel.text=String(targetValue)
        
        roundLabel.text=String(rounds)
        
    }
    
    @IBAction func startNewGame() {
        score = 0
        rounds = 0
        
        scoreLabel.text = String(score)
        roundLabel.text = String(rounds)
        
        startNewRound()
    }
    
    @IBAction func showAlert() {
        
        var difference = currentValue - targetValue
        
        if difference < 0 {
            difference = difference * -1
        }
        
        scoreInRound = 100 - difference
        
        score += scoreInRound
        
        var title: String
        if difference == 0 {
                title = "Perfect Score!"
            } else if difference < 5 {
                title = "Ohh! You almost had it!"
            } else if difference < 10 {
                title = "Pretty good! Try Again!"
            } else {
                title = "Not even close :-("
        }
        
        
        scoreLabel.text = String(score)
        
        
        
        
        
        let message = "\(currentValue)"
                + "\n\(title)"
        let alert = UIAlertController(title: message, message: "You scored \(scoreInRound)", preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
        targetLabel.text=String(targetValue)

        updateLabels()
    }
    
    @IBAction func SliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }
    
}

