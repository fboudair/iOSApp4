import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart  //this object holds the products in the cart
    @Environment(\.presentationMode) var presentationMode   //closing the current view when thw back button is click
    
    var body: some View {
        NavigationView {
            VStack {
                if cart.items.isEmpty {     // Display a message if the cart is empty
                    VStack {
                        Image(systemName: "cart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                        Text("Your cart is empty")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                } else {     // display each product  in the cart
                    List {
                        ForEach(cart.items) { cartItem in
                            NavigationLink(destination: ProductItemView(product: cartItem.product, cart: cart)) {   //each product when click opens the products view
                                HStack {
                                    Image(cartItem.product.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(10)
                                    
                                    VStack(alignment: .leading) {
                                        Text(cartItem.product.name)
                                            .font(.headline)
                                        
                                        Text("$\(cartItem.product.price, specifier: "%.2f") x\(cartItem.quantity)")    // showing the products price and quantity
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    
                                    Button(action: {    // a buttom to remove the item from the cart
                                        cart.removeCart(product: cartItem.product)
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                .padding(.vertical, 5)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Total: ")   // showing the total price of the cart
                            .font(.headline)
                        Spacer()
                        Text("$\(cart.items.reduce(0) { $0 + $1.product.price * Double($1.quantity) }, specifier: "%.2f")")
                            .font(.headline)
                            .bold()
                    }
                    .padding()
                    
                    NavigationLink(destination: PaymentView()) {      // when the pay now buttom is click payment view will be open
                        Text("Pay Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(15)
                            .padding(.bottom)
                    }
                }
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {   // a buttom to go back
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cart: Cart())
    }
}
