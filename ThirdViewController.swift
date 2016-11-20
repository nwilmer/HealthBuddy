//
//  ThirdViewController.swift
//  Mental_Health
//
//  Created by Nicolas Wilmer on 11/20/16.
//  Copyright © 2016 Nicolas Wilmer. All rights reserved.
//

import Foundation
import UIKit
import ResearchKit


class ThirdViewController : UIViewController{
    let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
    var firstSurveyResults = [ORKQuestionResult]()
    var sliderResults = [Double]()
    var secondResults = [ORKStepResult]()
    var secondStepResults = [ORKQuestionResult]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func yesTapped(sender : AnyObject){
        UIApplication.shared.openURL(NSURL(string: "tel://911")! as URL)
        
        
        // create the alert
        let alert = UIAlertController(title: "Emergency Call Placed", message: "Help is on the way!", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func surveyTapped(sender: AnyObject){
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
//    func newView(){
//        print("poop")
//        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewFour")
//        taskViewController.present(nextVC!, animated: true, completion: nil)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestVC : FourthViewController = segue.destination as! FourthViewController
        DestVC.surveyTwoResults = secondStepResults
        DestVC.surveyOneResults = firstSurveyResults
        DestVC.sliderResults = sliderResults
    }
    
    
}

extension ThirdViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        let taskResults = taskViewController.result
                    secondResults = taskResults.results as! [ORKStepResult]
                    secondResults.remove(at: 0)
                    for result in secondResults{
                        secondStepResults += result.results as! [ORKQuestionResult]
                        for stepResult in secondStepResults{
                            let step: ORKStepResult = stepResult as! ORKStepResult
                            if step.identifier == "Eat"{
                            let eatResult = step.results![0] as! ORKScaleQuestionResult
                            let eatNum = Double(eatResult.scaleAnswer!)
                            }
                            else if step.identifier == "Drink"{
                                let drinkResult = step.results![0] as! ORKScaleQuestionResult
                                let drinkNum = Double(drinkResult.scaleAnswer!)
                            }
                           else  if step.identifier == "Sleep"{
                                let sleepResult = step.results![0] as! ORKScaleQuestionResult
                                let sleepNum = Double(sleepResult.scaleAnswer!)

                        }
                            
                    }
        //if taskViewController.result.identifier
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewFour")
        taskViewController.present(nextVC!, animated: true, completion: nil)
}
    }}
