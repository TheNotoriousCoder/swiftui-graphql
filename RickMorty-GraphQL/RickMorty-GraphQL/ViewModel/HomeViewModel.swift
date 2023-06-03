//
//  HomeViewModel.swift
//  RickMorty-GraphQL
//
//

import Foundation
import SwiftUI
class HomeViewModel: ObservableObject {
    //MARK: Empty array of characters
    @Published var multipleCharacters: [CharactersByID] = []
    
    func queryMultipleCharacterWithId(randomIds: [Int], onError: @escaping(_ error: String) -> Void) async {
        //MARK: To produce an error you may switch the URL
        
        let validURL = "https://rickandmortyapi.com/graphql"
        let errorURL = "https://thisshouldproduce.an/error"
        
        
        
        //MARK: Creating the request
        var request = URLRequest(url: URL(string: validURL)!)
        request.httpMethod = "POST"
       request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //MARK: GraphQL query - with the selected fields/value
        let query =
                    """
                    {
                    charactersByIds(ids: \(randomIds)) {
                      id
                      created
                      name
                      image
                      gender
                      species
                      status
                    }
                    }
                    """

        //MARK: Creating an instance of payload
        let payload = Payload(query: query)
        let postData = try! JSONEncoder().encode(payload)
        request.httpBody = postData

        do {
            //MARK: Get the response from the request and use JSONDecoder to conform the downloaded/raw data to a model
            let response = try await URLSession.shared.data(for: request)
            let jsonData = response.0
            let jsonDecoder = JSONDecoder()
            let graphQLResponse = try jsonDecoder.decode(MultipleCharacterResponse.self, from: jsonData)
            //MARK: Error handling - check if data is not nil
            if graphQLResponse.data?.charactersByIDS != nil {
                    //MARK: Update on the main thread, as this affects the UI
                    DispatchQueue.main.async {
                        self.multipleCharacters = (graphQLResponse.data?.charactersByIDS)!
                    }
            }
        } catch let error {
            //MARK: Escaping closure allows to capture the value of the error and display to user + printed for own use
            onError(error.localizedDescription)
            print("JSON Error \(error.localizedDescription)")
        }
    }

}
