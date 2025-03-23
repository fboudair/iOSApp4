import SwiftUI

struct CategoryItemView: View {
    let category: Category
    let products: [Product]
    @StateObject var cart = Cart()
    
    var body: some View {
        NavigationLink(destination: CategoryDetailView(category: category, products: products, cart: cart)) {
            HStack(alignment: .center, spacing: 6) {
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)
                Text(category.name.uppercased())
                    .fontWeight(.light)
                    .foregroundColor(Color.gray)
                Spacer()
            }
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(category: categories[0], products: products, cart: Cart())
            .previewLayout(.sizeThatFits)
            .background(Color("ColorBackground"))
            .padding()
    }
}
