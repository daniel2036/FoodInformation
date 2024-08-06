//
//  FoodInformationApp.swift
//  FoodInformation
//
//  Created by Daniel Xu on 2024/6/12.
//

import SwiftUI

@main
struct FoodInformationApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
