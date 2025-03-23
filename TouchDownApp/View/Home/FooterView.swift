//
//  FooterView.swift
//  TouchDownApp
//
//  Created by Louise Rennick on 2025-03-03.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 10 ){
            Text("Luxury jewelry store offer high-end pieces crafted from gold, platinum,diamonds, and rare gemstones.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            Image("diamond-stone")
                .renderingMode(.original)
                .foregroundColor(.gray)
                .layoutPriority(0)
            Text("Copyright © 2025 TouchDownApp. All rights reserved.")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
            
        }//VStack
        .padding()
    }
}

struct FootFooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
