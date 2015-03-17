//
//  AppDelegate.swift
//  fitlrDataTestingPlayground
//
//  Created by Jay Murchinson on 3/3/15.
//  Copyright (c) 2015 fitlrco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //Parse keys
        Parse.setApplicationId("gFfrDr1tzoXsFkwCHO704CEeX0yxRSuH4ElpX1wx", clientKey: "pSRR6NN9A2ZmMlF6j7pDVYiEb2vGZRXL9u99QLpG")
        
        var gameScore = PFObject(className:"GameScore")
        gameScore["score"] = 1337
        gameScore["playerName"] = "Matt Plott"
        gameScore["cheatMode"] = false
        gameScore.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }

        
        
        
        var query = PFQuery(className:"GameScore")
        query.getObjectInBackgroundWithId("MdFIGbgEwk") {
            (gameScore: PFObject!, error: NSError!) -> Void in
            if error == nil && gameScore != nil {
                let score = gameScore["score"] as Int
                let playerName = gameScore["playerName"] as String
                let cheatMode = gameScore["cheatMode"] as Bool
                
                if score == 1337 {
                    let objectId = gameScore.objectId
                    let updatedAt = gameScore.updatedAt
                    let createdAt = gameScore.createdAt
                    
                    println(objectId)
                    println(updatedAt)
                    println(createdAt)
                    
                   // query.refresh()
                }
            } else {
                println(error)
            }
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

