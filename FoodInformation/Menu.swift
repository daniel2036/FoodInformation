//
//  Menu.swift
//  FoodInformation
//
//  Created by Daniel Xu on 2024/6/12.
//

import Foundation

struct MenuSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

struct MenuItem: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var photoCredit: String
    var price: Int
    var restrictions: [String]
    var description: String
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
}
