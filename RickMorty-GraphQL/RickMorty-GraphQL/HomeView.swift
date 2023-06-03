//
//  ContentView.swift
//  RickMorty-GraphQL
//
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @State var errorMessage = String()
    var body: some View {
        NavigationView {
            //MARK: Simply checking the value of error message we can decide which view should be displayed
            if errorMessage.isEmpty {
                ListView()
            } else if !errorMessage.isEmpty {
                ErrorView()
            }
        }
        .task {
            //MARK: We capture an assign the value of the error in real-time which can be used to display
            //MARK: The 'produceRandomArray' functions allows to change the parameters of the ids we'll search for
            await homeViewModel.queryMultipleCharacterWithId(randomIds: produceRandomArrayOfNumbers(), onError: { error in
                errorMessage = error
            })
        }
    }
    
    //MARK: An array consist of 15 values, each value in the range of 1 to 500
    private func produceRandomArrayOfNumbers() -> [Int] {
        let randomArray = (1...15).map( {_ in Int.random(in: 1...500)} )
        return randomArray
        }
    
    //MARK: Refactored for legibility reasons
    @ViewBuilder func ListView() -> some View {
        List(homeViewModel.multipleCharacters, id: \.id) { character in
            NavigationLink(destination: DetailView(character: character)) {
                ListRowView(character: character)
            }
        }
        .navigationTitle("Rick & Morty")
        .padding(.top)
    }
    
    @ViewBuilder func ErrorView() -> some View {
        ErrorMessageView(errorMessage: errorMessage)
    }
    
}
