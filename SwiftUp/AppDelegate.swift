//
//  AppDelegate.swift
//  SwiftUp
//
//  Created by baidu on 2018/10/30.
//  Copyright © 2018 mahp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var a = 3;
        a += 1;
        print(a)
        var b :Optional <Int>
        b = 100;
        print(b!);
        
        
        var string = "String enable"
        string = "1"
        let myString = String("MyString Enable")
        print("\(string + myString)")
        let newString = string + myString
        for ch in newString {// 正序遍历
            print(ch)
        }
        for ch in newString.reversed(){
            print(ch)
        }
        for i in 0..<newString.count{
            let ch: Character = newString[newString.index(newString.startIndex, offsetBy: i)]
            print(ch)
        }
        
        for (i, ch) in newString.enumerated(){
            print(ch)
        }
        var tmp : Array = Array.init(repeating: 3, count: 5)
        tmp.remove(at: 1)
        print( tmp.enumerated())
        
        for t in tmp.enumerated(){
            guard t.offset == 2 else {
                continue
            }
            tmp.remove(at: t.offset)
        }
        let tmpArr : Array = [1,2,3,4,5]
        let rrr = 3
        let m = tmpArr.reduce(into:rrr ) { (resault, xxx) in
            print(resault)
            resault += xxx
        }

        let n = tmpArr.reduce("-") { (Result, next) -> String in
            print(Result)
            return Result + String(next)
            print(Result)
        }
        
        return true
    }

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

