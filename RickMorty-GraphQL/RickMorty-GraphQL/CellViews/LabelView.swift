//
//  LabelView.swift
//  RickMorty-GraphQL
//
//

import Foundation
import SwiftUI
struct LabelView: View {
    var value: String?
    var body: some View {
        Text(value?.capitalized ?? "")
            .font(.system(size: 14, weight: .bold, design: .default))
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(Color.gray.opacity(0.5).cornerRadius(5))
    }
}
