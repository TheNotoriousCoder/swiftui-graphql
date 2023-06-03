//
//  ListRowView.swift
//  RickMorty-GraphQL
//
//

import Foundation
import SwiftUI
struct ListRowView: View {
    var character: CharactersByID
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .center, spacing: 12) {
                AsyncImageView(imageURL: character.image, height: UIScreen.main.bounds.width * 0.1, width: UIScreen.main.bounds.width * 0.1)
                    .clipShape(Circle())
                Text(character.name ?? "")
                    .font(.title2)
                Spacer()
                Text("ID: #\(character.id ?? "")")
                .font(.caption)
                
            }
        }
    }
}
