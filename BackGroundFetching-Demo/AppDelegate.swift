//
//  AppDelegate.swift
//  BackGroundFetching-Demo
//
//  Created by vignesh kumar c on 03/05/23.
//

import UIKit
import BackgroundTasks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "comvigneshzx.BackGroundFetching-Demo", using: nil) { task in
            
        }
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let url = URL(string: "https://www.vialyx.com") {
            // Send request
            URLSession.shared.dataTask(with: url, completionHandler: { (data, respone, error) in
                // Check Data
                guard let `data` = data else { completionHandler(.failed); return }
                // Get result from data
                let result = String(data: data, encoding: .utf8)
                // Print result into console
                print("performFetchWithCompletionHandler result: \(String(describing: result))")
                // Call background fetch completion with .newData result
                completionHandler(.newData)
            }).resume()
        }
    }
}

