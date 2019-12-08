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
    //Guard statement in order to avoid bad input
        //Convert the question number input to string and make sure it's not empty
        guard let questionNumberAsString = questionNumberInput.text,questionNumberAsString.count>0 else {checkResult.text = "Please enter an integer value greater than 0"
            return
        }
        //Convert the question number string to integer
        guard let questionNumberAsInt = Int(questionNumberAsString)else{
            checkResult.text = "Please enter an integer value greater than 0"
            return
        }
        //Make sure student answer have the same number and convert it to string
        guard let studentAnswerAsString = studentAnswerInput.text,studentAnswerAsString.count == questionNumberAsInt
            else{
                checkResult.text = "Please be sure you input exactly \(questionNumberAsInt) student answers"
                return
        }
        //Make sure correct answer have the same number and convert convert it to string
        guard let correctAnswerAsString = correctAnswerInput.text,correctAnswerAsString.count == questionNumberAsInt else{
            checkResult.text = "Please be sure you input exactly \(questionNumberAsInt) answers for the answer key"
            return
        }
        let allPossibleAnswer = "ABCDE"
    //Make sure student and correct answers both contain only A,B,C,D,E
        for eachStudentAnswer in studentAnswerAsString {
            guard  allPossibleAnswer.contains(eachStudentAnswer) else{
                checkResult.text = "Student answers contain invalid choices, please ensure only character A, B, C, D or E are used"
                return
            }
        }
        for eachCorrectAnswer in correctAnswerAsString {
            guard allPossibleAnswer.contains(eachCorrectAnswer) else {
                checkResult.text = "Correct answers contain invalid choices, please ensure only character A, B, C, D or E are used"
                return
            }
        }
        //Set two variables represent the index in correct answer
        //and the number of correct number
        var index = -1
        var correctNumber = 0
        //Use a for in loop to check if each student answer is the same as the correspond correct answer
        for eachStudentAnswer in studentAnswerAsString{
            //if index == questionNumberAsInt + 1{
                //break
            //}
            //Each time the for in loop works, index plus one so that we jumped to the next correct answer
            index += 1
            let theNthCorrectAnswer = correctAnswerAsString.index(correctAnswerAsString.startIndex, offsetBy: index)
            //If they are the same, the number of correct number plus one, else plus zero
            if eachStudentAnswer == correctAnswerAsString[theNthCorrectAnswer] {
                correctNumber += 1
            }else{
                correctNumber += 0
            }
        }
        //Print the result
        checkResult.text = "The student answered \(correctNumber) question(s) correctly"
        
        
    }
    
    
}




