//
//  ItemRow.swift
//  FoodInformation
//
//  Created by Daniel Xu on 2024/6/12.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    var body: some View {
        VStack {
            HStack {
                Image(item.thumbnailImage)
                    .overlay(Rectangle().stroke(.gray, lineWidth: 2))
                Text(item.name)
            }
        }
    }
}
