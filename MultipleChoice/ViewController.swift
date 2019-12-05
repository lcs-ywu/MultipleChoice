//
//  ViewController.swift
//  MultipleChoice
//
//  Created by James Wu on 2019-12-03.
//  Copyright © 2019 James Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var questionNumberInput: UITextField!
    @IBOutlet weak var studentAnswerInput: UITextField!
    @IBOutlet weak var correctAnswerInput: UITextField!
    @IBOutlet weak var checkResult: UITextView!
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func checkAnswers(_ sender: Any) {
        guard let questionNumberAsString = questionNumberInput.text,questionNumberAsString.count>0 else {checkResult.text = "Please enter an integer value greater than 0"
            return
        }
        guard let questionNumberAsInt = Int(questionNumberAsString)else{
            checkResult.text = "Please enter an integer value greater than 0"
            return
        }
        guard let studentAnswerAsString = studentAnswerInput.text,studentAnswerAsString.count == questionNumberAsInt
            else{
                checkResult.text = "Please be sure you input exactly \(questionNumberAsInt) student answers"
                return
        }
        guard let correctAnswerAsString = correctAnswerInput.text,correctAnswerAsString.count == questionNumberAsInt else{
            checkResult.text = "Please be sure you input exactly \(questionNumberAsInt) answers for the answer key"
            return
        }
        let allPossibleAnswer = "ABCDE"
        
        for eachStudentAnswer in studentAnswerAsString {
            
            guard  allPossibleAnswer.contains(eachStudentAnswer) else{
                checkResult.text = "Student answers contain invalid choices, please ensure only character A, B, C, D or E are used"
                return
            }
            for eachCorrectAnswer in correctAnswerAsString {
                guard allPossibleAnswer.contains(eachCorrectAnswer) else {
                    checkResult.text = "Correct answers contain invalid choices, please ensure only character A, B, C, D or E are used"
                    return
                }
                
                
                
            }
        }
        
        
        
        
        
        
        
        
    }
    
    
}

