//
//  LocalNotificationManager.swift
//  ClearAcquire
//
//  Created by Remmington Damper on 10/19/22.
//

import Foundation
import UserNotifications

public class LocalNotificationManager {
    let delegate = UNUserNotificationCenter.current()
    static let instance = LocalNotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.badge, .alert, .sound]
        delegate.requestAuthorization(options: options) { success, error in
            guard success else {
                print(error?.localizedDescription ?? "could not find error")
                return
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "You Are Only 1 Deal Away from Financial Freedom:"
        content.subtitle = "The journey of a thousand miles begins with a single step"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        delegate.add(request)
    }
}
