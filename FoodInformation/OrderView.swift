//
//  OrderView.swift
//  FoodInformation
//
//  Created by Daniel Xu on 2024/6/13.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) {item in
                        HStack {
                            Text(item.name)
                            Spacer()
                        }
                        swipeActions(allowsFullSwipe: false) {
                            Button {
                                order.remove(item: item)
                            } label: {
                                Label("Remove from order", systemImage: "x.circle.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
            }
            .navigationTitle("Order")
        }
    }
}
