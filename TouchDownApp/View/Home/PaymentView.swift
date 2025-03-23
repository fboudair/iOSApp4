//
//  PaymentView.swift
//  TouchDownApp
//
//  Created by Fatima Bdair on 2025-03-10.
//

import SwiftUI
struct PaymentView: View {
    @State private var name = ""
    @State private var cardNumber = ""
    @State private var expireDate = ""
    @State private var cvv = ""
    @State private var isProssessing = false
    var body: some View {
        VStack {
            Text ("Card Details")
                .font (.largeTitle)
                .fontWeight(.bold)
                .padding(.top,20)
            Spacer()
            TextField ("Personal Information", text:$name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField ("Card Number", text:$cardNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            TextField ("Expire Date", text:$expireDate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            TextField ("CVV", text:$cvv)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            Spacer()
            Button (action:{ proccessingPayment()}) {
                Text (isProssessing ? "processing...":"Payment Successful")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(15)
            }
            .padding(.bottom,20)
            .disabled(isProssessing)
        }
        .padding()
        .navigationBarTitle ("CHECKOUT",displayMode: .inline)
    }
    private func proccessingPayment() {
        isProssessing = true
        DispatchQueue .main.asyncAfter(deadline: .now()+2) {
            isProssessing = false
        }
    }
}







