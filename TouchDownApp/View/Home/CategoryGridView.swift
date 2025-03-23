import SwiftUI

struct CategoryGridView: View {
    let categories: [Category]
    let products: [Product]
    
    @StateObject var cart = Cart()
    
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    let columnSpacing: CGFloat = 15
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                Section(
                    header: SectionView(rotateClockwise: false),
                    footer: SectionView(rotateClockwise: true)
                ) {
                    ForEach(categories) { category in
                        NavigationLink(destination: CategoryDetailView(category: category, products: products, cart: cart)) {
                            CategoryItemView(category: category, products: products)
                        }
                    }
                }
            })
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        } 
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView(categories: categories, products: products)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray.opacity(0.2))
    }
}
