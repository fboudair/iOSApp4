//
//  LogoView.swift
//  TouchDownApp
//
//  Created by Louise Rennick on 2025-03-03.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack (spacing: 4){
            Text("JEWELRY".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            //text 1
            Image("diamond")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30,alignment: .center)
            
            Text("STORE".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            
                
            
        }//:HSTACK
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
