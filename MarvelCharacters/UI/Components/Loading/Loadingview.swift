//
//  Loadingview.swift
//  MarvelCharacters
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import SwiftUI

struct Loadingview: View {
    
    @State var fileName: String
    
    var body: some View {
        VStack{
            Spacer()
            LottieView(lottieFile: $fileName)
                .frame(width: 120, height: 120)
            Spacer()
        }
        
    }
}

