//
//  AppDelegate.swift
//  Example
//
//  Created by Marco Capano on 22/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let messagesDelegate = ExampleCollectionViewDelegate(myID: "myID")
    let inputDelegate = ExampleInputBarDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let vc = ExampleChatViewController(collectionViewLayout: UICollectionViewFlowLayout())
        vc.inputBar.delegate = inputDelegate
        vc.delegate = messagesDelegate
        
        //Some fake content
        let me = ExampleUser(name: "Marco", id: "myID")
        vc.messages = ExampleMessage.mockMessages
        
        inputDelegate.vc = vc
        inputDelegate.user = me
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

