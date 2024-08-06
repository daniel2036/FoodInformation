//
//  CheckoutView.swift
//  FoodInformation
//
//  Created by Daniel Xu on 2024/6/14.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    let paymentTypes = ["Cash", "Credit Card", "Points"]
    @State private var paymentType = "Cash"
    @State private var addAccountDetails = false
    @State private var memberNumber = ""
    @State private var additionalNotes = ""
    @State private var showingPaymentAlert = false
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Exisiting member?", isOn: $addAccountDetails)
                if addAccountDetails {
                    TextField("Enter your member number", text: $memberNumber)
                }
                TextField("Additional notes", text: $additionalNotes)
            }
            Section("Confirm") {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showingPaymentAlert) {
            
        }
    }
}
