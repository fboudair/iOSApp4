import SwiftUI

import SwiftUI

struct NavigationBarView: View {
    @State private var isAnimated: Bool = false
    @ObservedObject var cart: Cart
    @State private var showCart: Bool = false //show cart manages the visibility of cart view
    @State private var showSearch: Bool = false  // show search manage the visibility of search view
    
    var body: some View {
        ZStack {
            Color("ColorBackground")  // add background of navigation bar
                .ignoresSafeArea(edges: .top)
            
            HStack {
                Button(action: {   // a buttom for search
                    withAnimation {
                        showSearch = true   // when the buttom is click show search begin true
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(.white)
                })
                
                Spacer()
                
                LogoView()
                    .opacity(isAnimated ? 1 : 0)
                    .offset(x: 0, y: isAnimated ? 0 : -25)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.isAnimated.toggle()
                        }
                    }
                
                Spacer()
                
                Button(action: { showCart.toggle() }, label: {    // a buttom for the cart
                    ZStack {
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        if cart.itemNum() > 0 {   // a circle will appear on the cart when is an item
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 14, height: 14)
                                .offset(x: -13, y: -10)
                                .overlay(
                                    Text("\(cart.itemNum())")  //the number of items in the cart is show
                                        .font(.caption)
                                        .foregroundColor(.black)
                                )
                        }
                    }
                })
                .fullScreenCover(isPresented: $showCart) {  //when show cart is true cart view will be show
                    CartView(cart: cart)
                }
            }
            .frame(height: 80)
            .padding(.horizontal, 15)
        }
        .frame(height: 80)
        .fullScreenCover(isPresented: $showSearch) {   // when show search is true the search view is show
            SearchResultsView(cart:cart)
        }
    }
}


struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(cart: Cart())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
