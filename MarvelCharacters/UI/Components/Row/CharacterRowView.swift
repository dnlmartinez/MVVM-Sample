//
//  CharacterRowView.swift
//  MarvelCharacters
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterRowView: View {
    
    var character: CharacterModel
    
    var body: some View {
        HStack{
            WebImage(url: URL(string: character.getUri()))
                .resizable()
                .placeholder(Image(Views.RowView.placeholderImg))
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .frame(width: 86, height: 90, alignment: .center)
                .clipped()
            
            Text(character.name)
                .font(.custom(Fonts.sf_round_black, size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.leading, 20)
            
            Spacer()
        }.frame(height: 90)
    }
}

