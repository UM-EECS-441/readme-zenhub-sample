//
//  SharedNotificationManager.swift
//  SafeGuide
//
//  Created by Sesh Sadasivam on 11/12/18.
//  Copyright © 2018 SAFEGUIDE. All rights reserved.
//

import Foundation
import UserNotifications

class SharedNotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    private var notificationIdentifiers: [String] = []
    
    override init() {
        super.init()
        self.notificationIdentifiers = []
    }
    
    func checkForAuthorization() {
        let center = UNUserNotificationCenter.current()
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge, .criticalAlert];
        
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
                // TODO: We'll want to let the user know that they should enable notifications
            }
        }
        
        center.requestAuthorization(options: options) {
            (granted, error) in
            if !granted {
                print("Something went wrong: User didn't grant permission for notifications :(")
            }
        }
        
        
        // Define the custom actions.
        let safeLocationAction = UNNotificationAction(identifier: "SAFE_LOCATION_ACTION",
                                                title: "Find nearby safe location",
                                                options: UNNotificationActionOptions.foreground)
        let crimeDataAction = UNNotificationAction(identifier: "CRIME_DATA_ACTION",
                                                 title: "Explore past crimes in the area",
                                                 options: UNNotificationActionOptions.foreground)
        // Define the notification type
        let defaultCategory =
            UNNotificationCategory(identifier: "OPEN_APP",
                                   actions: [safeLocationAction, crimeDataAction],
                                   intentIdentifiers: [],
                                   hiddenPreviewsBodyPlaceholder: "",
                                   options: .customDismissAction)
        // Register the notification type.
        center.setNotificationCategories([defaultCategory])
        center.delegate = self
    }
    
    
    func sendLocalNotification(content: UNMutableNotificationContent) -> String {
        let center = UNUserNotificationCenter.current()
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let identifier = "\(hour):\(minutes)"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: nil)
        center.add(request)
        return identifier
    }
    
    
    func sendProactiveNotification(city: SupportedCity) {
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "OPEN_APP"
        
        switch city {
        case .baltimore:
            content.title = "Welcome to Baltimore!"
            content.body = "Make sure to check SafeGuide before planning a new route."
        case .chicago:
            content.title = "Welcome to Chicago!"
            content.body = "Make sure to check SafeGuide before planning a new route."
        }
        self.notificationIdentifiers.append(sendLocalNotification(content: content))
    }
    
    
    func sendReactiveNotification(_: Double!) {
        let content = UNMutableNotificationContent()
//        content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "Noir"))
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "OPEN_APP"
        
        content.title = "⚠️ You may be in an unsafe area!"
        content.body = "Open the app now to find a nearby safe location."
        
        self.notificationIdentifiers.append(sendLocalNotification(content: content))
    }
    
    
    func withdrawReactiveNotification() {
        let center = UNUserNotificationCenter.current()
        center.removeDeliveredNotifications(withIdentifiers: self.notificationIdentifiers)
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler:
        @escaping () -> Void) {
        
        // Perform the task associated with the action.
        switch response.actionIdentifier {
        case "SAFE_LOCATION_ACTION":
            Globals.tabBarController?.selectedIndex = 0
            break

        case "CRIME_DATA_ACTION":
            Globals.tabBarController?.selectedIndex = 1
            break

            // Handle other actions…

        default:
            Globals.tabBarController?.selectedIndex = 0
            break
        }
        
        // Always call the completion handler when done.
        completionHandler()
    }
    
    
    
}
