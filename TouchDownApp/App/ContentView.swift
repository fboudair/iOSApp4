import SwiftUI

struct ContentView: View {
    @StateObject var cart = Cart()
    

    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorBackground")
                       .ignoresSafeArea()

                VStack(spacing: 0) {
                    Spacer().frame(height: 20)

                    NavigationBarView(cart: cart)
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .background(Color("ColorBackground"))
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .padding(.vertical, 20)
                                .frame(height: UIScreen.main.bounds.width / 1.475)
                            
                            CategoryGridView(categories: categories, products: products)

                            ForEach(categories, id: \.id) { category in
                                VStack(alignment: .leading, spacing: 10) {
                                    TitleView(title: category.name)
                                    
                                    let filteredProducts = products.filter { $0.categoryId == category.id }
                                    
                                    if !filteredProducts.isEmpty {
                                        LazyVGrid(columns: gridLayout, spacing: 15) {
                                            ForEach(filteredProducts, id: \.id) { product in
                                                ProductItemView(product: product, cart: cart)
                                            }
                                        }
                                    } else {
                                        Text("No products available")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .padding(.leading)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 15)
                            }
                            
                            BrandGridView()
                            FooterView()
                                .padding(.horizontal)
                        }
                    }
                    .background(Color("ColorBackground").ignoresSafeArea())
                }
            }
            .navigationBarHidden(true)
        }
    }
}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()

    }

}
