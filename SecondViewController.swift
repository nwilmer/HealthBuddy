//
//  SecondViewController.swift
//  Mental_Health
//
//  Created by Nicolas Wilmer on 11/19/16.
//  Copyright © 2016 Nicolas Wilmer. All rights reserved.
//

import Foundation
import UIKit
import ResearchKit

class SecondViewController : UIViewController{
    @IBOutlet weak var welcomeLabel = UILabel()
    var surveyResults = [ORKQuestionResult]()
    var sliderRes = [Double]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = surveyResults[0] as! ORKTextQuestionResult
        welcomeLabel?.text = "Hello \(name.textAnswer!)"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resultsTapped(sender : AnyObject) {
        print(surveyResults)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestVC : ThirdViewController = segue.destination as! ThirdViewController
        DestVC.firstSurveyResults = surveyResults
        DestVC.sliderResults = sliderRes
    }

    
    class Response{
        
        init(places: Set<place>, emotions: Set<emotion>, descriptorss: Set<descriptors>){
            self.places = places
            self.descriptorss = descriptorss
            self.emotions = emotions
            self.text = ""
            self.link = URL(string:"words")!
        }
        var places = Set<place>()
        var emotions = Set<emotion>()
        var descriptorss = Set<descriptors>()
        var link:URL
        var text:String
        
        func getPlaces() -> Set<place>{
            return places
        }
        
        func getDescriptors() -> Set<descriptors>{
            return descriptorss
        }
        
        func getEmotions() -> Set<emotion>{
            return emotions
        }
        
        func getText() -> String{
            return text
        }
        
        func setText(text:String){
            self.text = text
        }
        
        func setLink(link:String){
            self.link = URL(string:link)!
        }
        
        func getLink() -> URL{
            return link
        }
    }
    
    enum place{
        case Public, SocialGathering, OutDoors, home
    }
    enum emotion{
        case Happy, Calm, Safe, Empowered
    }
    enum descriptors{
        case Active, Social, Organized, Loud, Productive, Basic
    }
    
    func getTag(emotion:emotion, arr:[Int]) -> descriptors{
        var copy = [Int]()
        for i in arr{
            copy.append(abs(50-i))
        }
        
        var maxCat = -1
        
        switch emotion{
        case .Happy:
            maxCat = copy.index(of: copy[0...4].max()!)!
        case .Calm:
            maxCat = copy.index(of: copy[5...9].max()!)!
        case.Empowered:
            maxCat = copy.index(of: copy[10...14].max()!)!
        case.Safe:
            maxCat = copy.index(of: copy[15...17].max()!)!
        }
        
        switch maxCat{
        case 0:
            return descriptors.Active
        case 1:
            return descriptors.Social
        case 2:
            return descriptors.Organized
        case 3:
            return descriptors.Loud
        case 4:
            return descriptors.Productive
        default:
            return descriptors.Basic
        }
    }
    
    func getResponses(responses:[Response], numResponses:Int, place:place, emotion: emotion, descriptior:descriptors) -> [Response] {
        var responseIndex = 0;
        var goodResponses = [Response]()
        var target = numResponses
        
        while(target > 0 && responseIndex < responses.endIndex){
            if((responses[responseIndex].getPlaces().contains(place)) && (responses[responseIndex].getEmotions().contains(emotion)) && ((responses[responseIndex].getDescriptors().contains(descriptior)) || responses[responseIndex].getDescriptors().contains(descriptors.Basic))){
                goodResponses.append(responses[responseIndex])
                target -= 1
                responseIndex += 1
            }else{
                responseIndex += 1
            }
        }
        return goodResponses
    }

}
