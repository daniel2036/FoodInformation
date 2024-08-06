//
//  ContentView.swift
//  FoodInformation
//
//  Created by Daniel Xu on 2024/6/12.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    @State private var searchText = ""
    @State private var searchIsActive = false
    
    var body: some View {
        NavigationStack {
            Text("Searching for \(searchText)")
            List {
                ForEach(menu) {section in
                    Section(section.name) {
                        let filteredItems = section.items.filter { item in
                            if searchText.isEmpty {
                                return true
                            } else {
                                return item.name.lowercased().contains(searchText.lowercased())
                            }
                        }
                        ForEach(filteredItems) {item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }.accessibilityIdentifier("\(item.name)").swipeActions(allowsFullSwipe: false) {
                                Button {
                                    print("\(item.name) added to order.")
                                } label: {
                                    Label("Add to Order", systemImage: "cart.badge.plus")
                                }
                                .tint(.green)
                                Button {
                                    print("\(item.name): \(item.description)")
                                } label: {
                                    Label("More Info", systemImage: "info.circle.fill")
                                }
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) {
                item in ItemDetail(item: item)
            }
            .navigationTitle("Food")
            .listStyle(.grouped)
            .accessibilityIdentifier("SearchBar")
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [MenuSection] {
        if searchText.isEmpty {
            return menu
        } else {
            return menu.filter { section in
                section.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
