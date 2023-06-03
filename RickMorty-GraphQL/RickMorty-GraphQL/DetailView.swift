//
//  DetailView.swift
//  RickMorty-GraphQL
//
//

import Foundation
import SwiftUI
struct DetailView: View {
    var character: CharactersByID
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            AsyncImageView(imageURL: character.image, height: UIScreen.main.bounds.height * 0.5, width: UIScreen.main.bounds.width * 0.85)
            HStack(alignment: .center, spacing: 16) {
                LabelView(value: character.gender)
                LabelView(value: character.status)
                LabelView(value: character.species)
            }.padding(.top, 16)
        }.padding()
        .navigationTitle(Text(character.name!))
    }
}
