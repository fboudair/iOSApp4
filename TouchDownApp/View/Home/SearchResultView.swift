import SwiftUI

struct SearchResultsView: View {
    @ObservedObject var cart: Cart
    @State private var searchQuery: String = ""    //a var for seach query
    @State private var filteredProducts: [Product] = []    // a list of products filter by the search query
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()  //when the back buttom is click close the current view
                    }) {
                        Text("< Back")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.top, 10)
                            .padding(.leading, 15)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    TextField("Search for products...", text: $searchQuery)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 15)
                        .onChange(of: searchQuery) { newValue in
                            filterProducts()
                        }
                    
                    Button(action: {   //a buttom for search
                        filterProducts()
                    }) {
                        Text("Search")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 15)
                
                if searchQuery.isEmpty || filteredProducts.isEmpty {   //showing a message if the search result is empty
                    Text("No results found.")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                } else {
                    List(filteredProducts, id: \.id) { product in    //showing the filter products
                       
                        NavigationLink(destination: ProductItemView(product: product, cart: cart)) {   //navigation link to open products view when clicked
                            HStack {
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading) {   //showing the products details
                                    Text(product.name)
                                        .font(.headline)
                                    Text("$\(product.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Search Results")
            .onAppear {
                filteredProducts = products
            }
        }
    }
    
    private func filterProducts() {   // function to filter products base on the search query
        let query = searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()  // trin and the search query
        
        if query.isEmpty {   // when the query is empty result is on all the products
            filteredProducts = products
        } else {
            filteredProducts = products.filter { product in  // filtering products base on their names
                let productName = product.name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                return productName.contains(query)  // returns true if we find a products that matching the query
            }
        }
    }
}
