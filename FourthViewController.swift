//
//  FourthViewController.swift
//  Mental_Health
//
//  Created by Nicolas Wilmer on 11/20/16.
//  Copyright © 2016 Nicolas Wilmer. All rights reserved.
//

import Foundation
import UIKit
import ResearchKit


class FourthViewController : UIViewController{
    var surveyOneResults = [ORKQuestionResult]()
    var surveyTwoResults = [ORKQuestionResult]()
    var sliderResults = [Double]()
    override func viewDidLoad() {
        super.viewDidLoad()
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}
    
    @IBAction func buttonPressed(sender: AnyObject){
        print("starting")
        
       //        print(surveyOneResults[0].answer as Any)
//        let name = surveyOneResults[20] as! ORKContinuousScaleAnswerFormat
        
//        print(name)
    }
}
