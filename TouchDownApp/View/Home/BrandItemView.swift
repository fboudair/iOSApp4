//
//  BrandItemView.swift
//  TouchDownApp
//
//  Created by Louise Rennick on 2025-03-05.
//

import SwiftUI

struct BrandItemView: View {
    let brand: Brand
    

    var body: some View {
        Image(brand.image)
            .resizable()
            .frame(width:80, height: 80)
            .padding(3)
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1)
            )
            .frame(width: 100, height: 100)
    }
}

struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(brand: brands[0])
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
            .padding()
    }
}
