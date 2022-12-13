//
//  latihan_swiftUIApp.swift
//  latihan-swiftUI
//
//  Created by nur kholis on 30/06/22.
//

import SwiftUI

@main
struct latihan_swiftUIApp: App {
    
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(order)
        }
    }
}
