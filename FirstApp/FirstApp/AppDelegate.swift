//
//  AppDelegate.swift
//  FirstApp
//
//  Created by MacMini03 on 09/10/19.
//  Copyright © 2019 MacMini03. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print (url)
        
        let urlComponents = URLComponents (url: url, resolvingAgainstBaseURL: true)
        
        let host = urlComponents?.host ?? ""
        
        print(host)
        
        if host == "secretPage1" {
            
            let sb = UIStoryboard(name: "Main" , bundle: .main)
            
            let secretVC1 = sb.instantiateViewController(withIdentifier: "SecretVC1") as! SecretViewController
            
            secretVC1.secretMessage1 = urlComponents?.queryItems?.first?.value
            
            window?.rootViewController = secretVC1
        }
        
        return true
    }
    
    
}

