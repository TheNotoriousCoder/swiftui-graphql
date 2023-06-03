//
//  MultipleCharacterResponse.swift
//  RickMorty-GraphQL
//
//

import Foundation
// MARK: - MultipleCharacterResponse
struct MultipleCharacterResponse:  Codable {
    let data: MultipleCharacterDataClass?
}

// MARK: - MultipleCharacterDataClass
struct MultipleCharacterDataClass: Codable {
    let charactersByIDS: [CharactersByID]?

    enum CodingKeys: String, CodingKey {
        case charactersByIDS = "charactersByIds"
    }
}

// MARK: - CharactersByID
struct CharactersByID: Codable {
    let id, created, name: String?
    let image: String?
    let gender, species, status: String?
}
