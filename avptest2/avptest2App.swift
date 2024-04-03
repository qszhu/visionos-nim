//
//  avptest2App.swift
//  avptest2
//
//  Created by qinsi on 2024/3/22.
//

import SwiftUI

class AppDelegateAdapter: AppDelegate {

}

@main
struct avptest2App: App {
    @UIApplicationDelegateAdaptor(AppDelegateAdapter.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
