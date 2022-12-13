//
//  CheckoutView.swift
//  latihan-swiftUI
//
//  Created by nur kholis on 30/06/22.
//

import SwiftUI
import Combine


struct CheckoutView: View {
    
    @ObservedObject private var zipCodeModel = ZipCodeModel()
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 10
    @State private var showPaymentAlert = false
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20,25, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
    
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay ? ", selection: $paymentType ) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add idine Loyalty Card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    VStack {
                        TextField("Enter your ID Number", text: $loyaltyNumber)
                            .keyboardType(.numberPad)
                            .onReceive(Just(loyaltyNumber)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue && self.loyaltyNumber.count <= 10 {
                                    self.loyaltyNumber = filtered
                                }
                            }
                        Spacer()
                        TextField("", text: $zipCodeModel.zip)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numberPad)
                                    .multilineTextAlignment(.center)
                    }
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0) %")
                    }
                }.pickerStyle(.segmented)
            }
            
            Section(header:
                        Text("TOTAL: \(totalPrice)").font(.largeTitle)
            ) {
                Button("Confirm order") {
                    showPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showPaymentAlert) {
            Alert(title: Text("Order confirmed \(loyaltyNumber)"),
                  message: Text("Your total was \(totalPrice) – thank you!"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
