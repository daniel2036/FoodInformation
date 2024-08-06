//
//  DessertViewModel.swift
//  FoodInformation
//
//  Created by Daniel Xu on 2024/6/20.
//

import SwiftUI

class DessertViewModel: ObservableObject {
    @Published var desserts = [Dessert]()
    func loadData() async {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else {return}
            print(response.statusCode)
            desserts = try decodeResponse(data: data, type: DessertResponse.self).meals
        } catch {
            print("Invalid data \(error)")
        }
    }
    func decodeResponse<T: Decodable>(data: Data, type: T.Type) throws -> T {
        do {
            let decodeResponse = try JSONDecoder().decode(T.self, from: data)
            return decodeResponse
        } catch {
            print("Invalid data \(error)")
            throw DessertError.decodeError
        }
    }
}

enum DessertError: Error {
    case decodeError
}
