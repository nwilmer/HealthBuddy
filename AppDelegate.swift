//
//  AppDelegate.swift
//  test
//
//  Created by Brittany Williams on 11/19/16.
//  Copyright © 2016 Brittany Williams. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        print("here")
        
        let running = Response(places:Set([place.Public, place.home, place.OutDoors]), emotions:Set([emotion.Happy, emotion.Calm, emotion.Safe]), descriptorss:Set([descriptors.Active]))
        running.setText(text: "Go take a walk")
        
        let getDressed = Response(places:Set([place.home]), emotions:Set([emotion.Happy, emotion.Calm, emotion.Safe, emotion.Empowered]), descriptorss:Set([descriptors.Basic]))
        getDressed.setText(text: "Have you gotten dressed today?")
        
        let drinkWater = Response(places:Set([place.home]), emotions:Set([emotion.Happy, emotion.Calm, emotion.Safe, emotion.Empowered]), descriptorss:Set([descriptors.Basic]))
        drinkWater.setText(text: "Stay hydrated")
        
        let eat = Response(places:Set([place.home]), emotions:Set([emotion.Happy, emotion.Calm, emotion.Safe, emotion.Empowered]), descriptorss:Set([descriptors.Basic]))
        eat.setText(text: "Make sure to eat today!")
        
        let shower = Response(places:Set([place.home]), emotions:Set([emotion.Happy, emotion.Calm, emotion.Safe, emotion.Empowered]), descriptorss:Set([descriptors.Basic]))
        shower.setText(text: "Take a hot shower")
        
        let sleep = Response(places:Set([place.home]), emotions:Set([emotion.Happy, emotion.Calm, emotion.Safe, emotion.Empowered]), descriptorss:Set([descriptors.Basic]))
        sleep.setText(text: "Go get some sleep")
        
        let stretch = Response(places:Set([place.home]), emotions:Set([emotion.Happy, emotion.Calm, emotion.Safe, emotion.Empowered]), descriptorss:Set([descriptors.Active]))
        stretch.setText(text: "Go do some stretches")
        
        let breathe = Response(places:Set([place.home, place.OutDoors, place.Public, place.SocialGathering]), emotions:Set([emotion.Happy, emotion.Calm, emotion.Safe]), descriptorss:Set([descriptors.Basic]))
        breathe.setLink(link: "http://i.imgur.com/2nkt1PW.gif")
        
        let puppyPicHappy = Response(places:Set([place.home, place.OutDoors, place.Public, place.SocialGathering]), emotions:Set([emotion.Happy]), descriptorss:Set([descriptors.Basic]))
        puppyPicHappy.setLink(link: "http://www.zarias.com/wp-content/uploads/2015/12/61-cute-puppies.jpg")
        
        let calmingCat = Response(places:Set([place.home, place.OutDoors, place.Public, place.SocialGathering]), emotions:Set([emotion.Calm]), descriptorss:Set([descriptors.Basic]))
        calmingCat.setLink(link: "http://imgur.com/CYU8JsN")
        
        let talkToPeople = Response(places:Set([place.SocialGathering]), emotions:Set([emotion.Calm, emotion.Empowered, emotion.Happy, emotion.Safe]), descriptorss:Set([descriptors.Social]))
        calmingCat.setText(text: "Go over and talk to someone!")
        
        let listenToHappyMusic = Response(places:Set([place.home, place.Public]), emotions:Set([emotion.Happy]), descriptorss:Set([descriptors.Loud]))
        calmingCat.setText(text: "Link to music")
        
        let cleanRoom = Response(places:Set([place.home]), emotions:Set([emotion.Calm, emotion.Empowered]), descriptorss:Set([descriptors.Productive]))
        calmingCat.setText(text: "Maybe you can clean up your room?")
        
        
        var responses = [Response]()
        
        responses.append(running)
        responses.append(getDressed)
        responses.append(drinkWater)
        responses.append(eat)
        responses.append(shower)
        responses.append(sleep)
        responses.append(stretch)
        responses.append(breathe)
        responses.append(puppyPicHappy)
        responses.append(calmingCat)
        responses.append(talkToPeople)
        responses.append(listenToHappyMusic)
        responses.append(cleanRoom)
        
        let goodResponses = getResponses(responses: responses, numResponses: 3, place: place.home, emotion: emotion.Calm, descriptior: descriptors.Basic)
        
        for res in goodResponses{
            print (res.getText())
        }
        
        var description = getTag(emotion: emotion.Happy, arr: [50,80,60,40,20,
                                                               10,0,0,0,0,
                                                               10,0,0,0,0,
                                                               10,0,0])
        
        return true
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
    
    //collection of responses
    //getPlace
    //(3 descriptors) return a response,
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

