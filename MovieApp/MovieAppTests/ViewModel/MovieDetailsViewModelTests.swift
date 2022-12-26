//
//  MovieDetailsViewModelTests.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest

@testable import MovieApp

final class MovieDetailsViewModelTests: XCTestCase {

    var localMovieService: LocalMovieService!
    var httpMovieService: MovieApiService!
    var sut: MovieDetailsViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        httpMovieService = MockMovieApiService()
        localMovieService = MockCachedMovieService()
        sut = MovieDetailsViewModel(movieInfo: Seeds.movieInfo, movieService: httpMovieService, localMovieService: localMovieService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        httpMovieService = nil
        localMovieService = nil
        try super.tearDownWithError()
    }

    func testGetMovieDetails() throws {
        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.start(created: 0, subscribed: 0, disposed: 100) {
            let response = self.sut.movieDetails.replayAll()
            _ = response.connect()
            self.sut.getMovieDetails()
            return response
        }
        XCTAssertEqual(result.events, [.next(0, Seeds.movieDetails)])
        
    }
    
    func testGetRottenTomatoesRatings() throws {
        let response = sut.getRottenTomatoRating(from: Seeds.movieDetails)
        XCTAssertEqual(response, "66%")
    }
    
    func testGetMetacriticRating() throws {
        let response = sut.getMetacriticRating(from: Seeds.movieDetails)
        XCTAssertEqual(response, "54/100")

    }
    func testGetActors() throws {
        let response = sut.getActors(from: Seeds.movieDetails)
        XCTAssertEqual(response, ["salman khan"])

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
