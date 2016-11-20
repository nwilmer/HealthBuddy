//
//  ViewController.swift
//  Mental_Health
//
//  Created by Nicolas Wilmer on 11/19/16.
//  Copyright © 2016 Nicolas Wilmer. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController {
    var results = [ORKStepResult]()
    var stepResults = [ORKQuestionResult]()
    var sliderResults = [Double]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func consentTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    func changeView(){
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "ViewTwo") as? SecondViewController
        present(secondVC!, animated: true, completion: nil)
    }
    
    func getResults() -> [ORKStepResult]{
        return results
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestVC : SecondViewController = segue.destination as! SecondViewController
        DestVC.surveyResults = stepResults
        DestVC.sliderRes  = sliderResults
    }
}

extension ViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        let taskResults = taskViewController.result
        results = taskResults.results as! [ORKStepResult]
        results.remove(at: 0)
        for result in results{
            stepResults += result.results as! [ORKQuestionResult]
                let step: ORKStepResult = result 
                if step.identifier == "HappyActive"{
                    let HappyActiveResult = step.results![0] as! ORKScaleQuestionResult
                    let HappyActiveNum = Double(HappyActiveResult.scaleAnswer!)
                    sliderResults.append(HappyActiveNum)
                }
                else if step.identifier == "HappySocial"{
                    let HappySocialResult = step.results![0] as! ORKScaleQuestionResult
                    let HappySocialNum = Double(HappySocialResult.scaleAnswer!)
                   sliderResults.append(HappySocialNum)
                }
                else  if step.identifier == "HappyOgranize"{
                    let HappyOrganizeResult = step.results![0] as! ORKScaleQuestionResult
                    let HappyOrganizeNum = Double(HappyOrganizeResult.scaleAnswer!)
                    sliderResults.append(HappyOrganizeNum)
                }
                else  if step.identifier == "HappyLoud"{
                    let HappyLoudResult = step.results![0] as! ORKScaleQuestionResult
                    let HappyLoudNum = Double(HappyLoudResult.scaleAnswer!)
                    sliderResults.append(HappyLoudNum)
                }
                else  if step.identifier == "HappyProductive"{
                    let HappyProductiveResult = step.results![0] as! ORKScaleQuestionResult
                    let HappyProductiveNum = Double(HappyProductiveResult.scaleAnswer!)
                    sliderResults.append(HappyProductiveNum)
                }
                else if step.identifier == "CalmActive"{
                    let CalmActiveResult = step.results![0] as! ORKScaleQuestionResult
                    let CalmActiveNum = Double(CalmActiveResult.scaleAnswer!)
                    sliderResults.append(CalmActiveNum)
                }
                else if step.identifier == "CalmSocial"{
                    let CalmSocialResult = step.results![0] as! ORKScaleQuestionResult
                    let CalmSocialNum = Double(CalmSocialResult.scaleAnswer!)
                    sliderResults.append(CalmSocialNum)
                }
                else  if step.identifier == "CalmOgranize"{
                    let CalmOrganizeResult = step.results![0] as! ORKScaleQuestionResult
                    let CalmOrganizeNum = Double(CalmOrganizeResult.scaleAnswer!)
                    sliderResults.append(CalmOrganizeNum)
                }
                else  if step.identifier == "CalmLoud"{
                    let CalmLoudResult = step.results![0] as! ORKScaleQuestionResult
                    let CalmLoudNum = Double(CalmLoudResult.scaleAnswer!)
                    sliderResults.append(CalmLoudNum)
                }
                else  if step.identifier == "CalmProductive"{
                    let CalmProductiveResult = step.results![0] as! ORKScaleQuestionResult
                    let CalmProductiveNum = Double(CalmProductiveResult.scaleAnswer!)
                    sliderResults.append(CalmProductiveNum)
                }
                else if step.identifier == "EmpoweredActive"{
                    let EmpoweredActiveResult = step.results![0] as! ORKScaleQuestionResult
                    let EmpoweredActiveNum = Double(EmpoweredActiveResult.scaleAnswer!)
                    sliderResults.append(EmpoweredActiveNum)
                }
                else if step.identifier == "EmpoweredSocial"{
                    let EmpoweredSocialResult = step.results![0] as! ORKScaleQuestionResult
                    let EmpoweredSocialNum = Double(EmpoweredSocialResult.scaleAnswer!)
                    sliderResults.append(EmpoweredSocialNum)
                }
                else  if step.identifier == "EmpoweredOgranize"{
                    let EmpoweredOrganizeResult = step.results![0] as! ORKScaleQuestionResult
                    let EmpoweredOrganizeNum = Double(EmpoweredOrganizeResult.scaleAnswer!)
                    sliderResults.append(EmpoweredOrganizeNum)
                }
                else  if step.identifier == "EmpoweredLoud"{
                    let EmpoweredLoudResult = step.results![0] as! ORKScaleQuestionResult
                    let EmpoweredLoudNum = Double(EmpoweredLoudResult.scaleAnswer!)
                    sliderResults.append(EmpoweredLoudNum)
                }
                else  if step.identifier == "EmpoweredProductive"{
                    let EmpoweredProductiveResult = step.results![0] as! ORKScaleQuestionResult
                    let EmpoweredProductiveNum = Double(EmpoweredProductiveResult.scaleAnswer!)
                    sliderResults.append(EmpoweredProductiveNum)
                }
                else  if step.identifier == "SafeOgranize"{
                    let SafeOrganizeResult = step.results![0] as! ORKScaleQuestionResult
                    let SafeOrganizeNum = Double(SafeOrganizeResult.scaleAnswer!)
                    sliderResults.append(SafeOrganizeNum)
                }
                else  if step.identifier == "SafeLoud"{
                    let SafeLoudResult = step.results![0] as! ORKScaleQuestionResult
                    let SafeLoudNum = Double(SafeLoudResult.scaleAnswer!)
                    sliderResults.append(SafeLoudNum)
                }
                else  if step.identifier == "SafeProductive"{
                    let SafeProductiveResult = step.results![0] as! ORKScaleQuestionResult
                    let SafeProductiveNum = Double(SafeProductiveResult.scaleAnswer!)
                    sliderResults.append(SafeProductiveNum)
            }
            
            }
        taskViewController.dismiss(animated: true, completion: nil)
        //if taskViewController.result.identifier

    }
    
}
