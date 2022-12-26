//
//  MovieListViewModelTests.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest

@testable import MovieApp

final class MovieListViewModelTests: XCTestCase {

    var localMovieService: LocalMovieService!
    var httpMovieService: MovieApiService!
    var sut: MovieListViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.\
        try super.setUpWithError()
        httpMovieService = MockMovieApiService()
        localMovieService = MockCachedMovieService()
        sut = MovieListViewModel(httpMovieService: httpMovieService, cachedMovieService: localMovieService)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        httpMovieService = nil
        localMovieService = nil
    }

    func testGetMovies() throws {
        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.start(created: 0, subscribed: 0, disposed: 100) {
            let response = self.sut.movies.replayAll()
            _ = response.connect()
            self.sut.getMovies(keyword: "Thor", page: 1, type: "movie")
            return response
        }
        XCTAssertEqual(result.events, [.next(0, Seeds.movies)])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
