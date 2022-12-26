//
//  CachedMovieServiceTests.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import XCTest

final class LocalMovieServiceTests: XCTestCase {

    var localMovieService: LocalMovieService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        localMovieService = MockCachedMovieService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        localMovieService = nil
        try super.tearDownWithError()
    }

    func testGetMovies() throws {
        let movieDetails = localMovieService.fetchMovies()
        XCTAssertNotNil(movieDetails)
    }
 
    
    func testGetMovieDetailsReturnInstance() throws {
        let movieDetails = localMovieService.fetchMovieDetails(imdbId: "tt0800368")
        XCTAssertNotNil(movieDetails)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
