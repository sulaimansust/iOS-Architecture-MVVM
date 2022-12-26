//
//  MovieApiServiceTests.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import XCTest
import RxSwift
import RxCocoa

@testable import MovieApp

final class MovieApiServiceTests: XCTestCase {

    var mockMovieApiService: MovieApiService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        mockMovieApiService = MockMovieApiService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockMovieApiService = nil
        try super.tearDownWithError()
    }

    func testSearchMovieReturnInstance() throws {
        let movies = mockMovieApiService.searchMovies(keyword: "Thor", page: 1, type: "movie")
        XCTAssertNotNil(movies)
    }
    
    func testGetMovieDetailsReturnInstance() throws {
        let movieDetails = mockMovieApiService.getMovieDetails(imdbId: "tt1981115")
        XCTAssertNotNil(movieDetails)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
