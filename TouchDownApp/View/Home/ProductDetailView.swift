import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var showAlert = false
    @State private var navigateToCart = false
    @ObservedObject var cart: Cart

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading, spacing: 10) {
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Text(product.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("$ \(product.price, specifier: "%.2f")")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(product.description)
                        .font(.body)
                        .padding(.top, 10)
                    Button(action: {
                        cart.addToCart(product: product)
                        showAlert = true
                    }) {
                        Text("Add to Cart")
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                }
                .padding()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Add to Cart"),
                    message: Text("\(product.name) is added to your cart"),
                    primaryButton: .default(Text("Go to Cart"), action: {
                        navigateToCart = true
                    }),
                    secondaryButton: .cancel(Text("Continue Shopping"))
                )
            }

            NavigationLink(destination: CartView(cart: cart), isActive: $navigateToCart) {
                EmptyView()
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductDetailView(product: products[0], cart: Cart())
        }
    }
}
