//
//  ViewController.swift
//  RCQuizApp
//
//  Created by Michael Chung on 1/15/17.
//  Copyright © 2017 Michael Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == rightAnswerPlacement {
            
            print ("RIGHT")
            points += 1
        } else {
            
            print ("WRONG")
        }
        
        if currentQuestion != questions.count {
            
            newQuestion()
        } else {
            
            scoreLabel.text = "You got \(points) out of 5 questions right!"
            scoreLabel.isHidden = false
        }
    }
    
    
    let questions = ["When was RC founded?", "What name did RC formerly go by?", "Who are RC's founders?", "What is RC's motto?", "Which one of the following is NOT one of RC's social rules?"]
    let answers = [["2011", "2009", "2012"], ["Hacker School", "X Combinator", "Recurse Bootcamp"], ["Nick, David, & Sonali", "Nick, Paul, & Sam", "David, Sonali, & Nancy"], ["Never graduate!", "Never get a job!", "Live long and prosper"], ["No swearing", "No well actuallys", "No feigning surprise"]]
    
    var currentQuestion = 0
    var rightAnswerPlacement = 0
    var points = 0
    
    func newQuestion() {
        
        label.text = questions[currentQuestion]
        
        rightAnswerPlacement = Int(arc4random_uniform(3))+1
        
        //Create a button
        var button:UIButton = UIButton()
        var x = 1
        for i in 1...3 {
            
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == rightAnswerPlacement) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            } else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }


}

