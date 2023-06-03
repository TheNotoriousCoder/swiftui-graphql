//
//  Payload.swift
//  RickMorty-GraphQL
//
//

import Foundation
struct Payload: Codable {
    var variables: String = "{}"
    var query: String
}
