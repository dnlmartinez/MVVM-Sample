//
//  DetailView.swift
//  MarvelCharacters
//
//  Created by daniel martinez gonzalez on 26/5/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    var character: CharacterModel
    
    var body: some View {
        
        VStack{
            WebImage(url: URL(string: character.getUri()))
                .resizable()
                .placeholder(Image(Views.DetailView.placeholderImg))
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .frame(width:  UIScreen.main.bounds.width, height: 220, alignment: .center)
            
        }.ignoresSafeArea()
        
        Text(character.name)
            .font(.custom(Fonts.sf_round_black, size: 26))
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
            .padding(.leading, 20)
        
        Divider()
            .frame(height: 3)
        
        ScrollView{
            Text(character.characterDescription)
                .font(.custom(Fonts.sf_round_black, size: 18))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.leading, 20)
        }
        
    }
}

