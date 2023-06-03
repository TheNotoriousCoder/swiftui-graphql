//
//  AsyncImageView.swift
//  RickMorty-GraphQL
//
//


//MARK: Created for reusability purposes, and allowing for custom height and width for the view
import Foundation
import SwiftUI
struct AsyncImageView: View {
    var imageURL: String?
    var height: CGFloat
    var width: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: imageURL!)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .cornerRadius(8)
        } placeholder: {
            ProgressView()
        }
    }
}
