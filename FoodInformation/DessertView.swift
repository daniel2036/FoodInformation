//
//  DessertView.swift
//  FoodInformation
//
//  Created by Daniel Xu on 2024/6/14.
//

import SwiftUI

struct DessertResponse: Codable, Equatable {
    var meals: [Dessert]
}

struct Dessert: Codable, Hashable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}

struct DessertView: View {
    @StateObject var dessertViewModel = DessertViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            Text("Searching for \(searchText)")
                .navigationTitle("Desserts")
            List(searchResults, id: \.idMeal) { item in
                VStack(alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: item.strMealThumb), scale: 15)
                        Text(item.strMeal)
                            .font(.headline)
                    }
                }
            }
            .task {
                await dessertViewModel.loadData()
            }
        }
        .searchable(text: $searchText)
    }
    var searchResults: [Dessert] {
        if searchText.isEmpty {
            return dessertViewModel.desserts
        } else {
            return dessertViewModel.desserts.filter {
                $0.strMeal.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
