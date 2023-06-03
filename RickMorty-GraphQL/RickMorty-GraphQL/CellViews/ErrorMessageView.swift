//
//  ErrorMessageView.swift
//  RickMorty-GraphQL
//
//

import Foundation
import SwiftUI
struct ErrorMessageView: View {
    var errorMessage: String
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Uh-oh something went wrong!")
                .font(.title3)
                .fontWeight(.semibold)
            Text(errorMessage)
                .multilineTextAlignment(.center)
                .font(.subheadline)
        }
    }
}
