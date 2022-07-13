//
//  wtmnewApp.swift
//  wtmnew
//
//  Created by Ananya Garg on 7/12/22.
//

import SwiftUI
import MapKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct wtmnewApp: App {
    @StateObject var viewRouter = ViewRouter()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ParentView().environmentObject(viewRouter)
        }
    }
}
