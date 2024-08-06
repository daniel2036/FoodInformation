//
//  MainView.swift
//  FoodInformation
//
//  Created by Daniel Xu on 2024/6/13.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem { Label("Menu", systemImage: "list.dash").accessibilityIdentifier("MenuTab")
                }
            DessertView()
                .tabItem { Label("Dessert", systemImage: "birthday.cake").accessibilityIdentifier("DessertTab")
                }
            OrderView()
                .tabItem { Label("Order", systemImage: "square.and.pencil").accessibilityIdentifier("OrderTab")
                }
        }
    }
}
