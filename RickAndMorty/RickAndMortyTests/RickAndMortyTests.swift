//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by RIMA on 9/3/2024.
//

import XCTest
import SwiftUI
@testable import RickAndMorty

final class RickAndMortyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInitialState() {
        let viewModel = CharacterListViewModel()
        XCTAssertEqual(viewModel.state, .loading, "Initial state should be loading")
    }
    
    func testFetchCharactersListSuccess() async {
        let expectation = XCTestExpectation(description: "Characters list fetched successfully")
        
        let mockCharacters = [      
            CharacterModel(name: "Rick Sanchez", photoURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: .male, status: .alive, species: "Human"),
            CharacterModel(name: "Morty Smith", photoURL: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", gender: .male, status: .alive, species: "Human")]
        
        let mockRepository = MockCharacterListRepository()
        let mockUseCase = GetCharactersListUseCase(charactersRepository: mockRepository)
        let viewModel = CharacterListViewModel(getCharactersListUseCase: mockUseCase)
        
        viewModel.fetchCharactersList()
        
         XCTAssertEqual(viewModel.state, .loaded(mockCharacters))
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 3)
        
        
    }
}



class MockCharacterListRepository : CharactersListRepositoryProtocol {
    
    func fetchCharactersList() async throws -> [RickAndMorty.CharacterResponse]? {
        let path = Bundle.main.path(
            forResource: "CharactersListMockData",
            ofType: "json")!
        
        let data = FileManager.default.contents(atPath: path)!
        await MainActor.waitFor(nanoseconds: 1_000_000_000)
        let result = try JSONDecoder().decode(APIResult<[CharacterResponse]>.self, from: data)
        
        return result.results
        
    }
    
}
