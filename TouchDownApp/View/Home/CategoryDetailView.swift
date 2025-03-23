import SwiftUI

import SwiftUI

struct CategoryDetailView: View {
    let category: Category
    let products: [Product]
    @ObservedObject var cart: Cart

    var body: some View {
        VStack {
            // Category Header
            Text(category.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Image(category.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            let filteredProducts = products.filter { $0.categoryId == category.id }

            if !filteredProducts.isEmpty {
                LazyVGrid(columns: gridLayout, spacing: 15) {
                    ForEach(filteredProducts, id: \.id) { product in
                        ProductItemView(product: product, cart: cart)
                    }
                }
                .padding(.top)
            } else {
                Text("No products available in this category.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding()
            }

            Spacer()
        }
        .padding()
        .navigationTitle(category.name) 
    }
}
