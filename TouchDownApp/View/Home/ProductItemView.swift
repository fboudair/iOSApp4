//
//  ProductItemView.swift
//  TouchDownApp
//
//  Created by Louise Rennick on 2025-03-05.
//

import SwiftUI

struct ProductItemView: View {
    // MARK: - PROPERTY
    
    let product: Product
    
    @ObservedObject var cart:Cart
    var body: some View {
        NavigationLink (destination: ProductDetailView (product: product,cart:cart)) {
            VStack(alignment: .leading, spacing: 6, content: {
                ZStack {
                    Image(product.image)
                        .resizable()
                        .frame(width:120,height:120)
                        .padding(10)
                }
                .background(Color(red: product.red, green: product.green, blue: product.blue))
                .cornerRadius(12)
                
         
                Text(product.name)
                    .font(.body)
                    .fontWeight(.black)
                
                Text("$\(product.price, specifier:"%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            })
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
  static var previews: some View {
      ProductItemView(product: products[0],cart:Cart())
      .previewLayout(.fixed(width: 200, height: 300))
      .padding()
      .background(colorBackground)
  }
}

