//
//  FeatureitemView.swift
//  TouchDownApp
//
//  Created by Louise Rennick on 2025-03-04.
//

import SwiftUI

struct FeaturedItemView: View {
  
  let player: Player
  
  
  var body: some View {
    Image(player.image)
     .resizable()
    .scaledToFit()
    .cornerRadius(10)
  }
}

// MARK: - PREVIEW

struct FeaturedItemView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedItemView(player: players[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}

