//
//  MovieListTests.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import XCTest

final class MovieListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCreateInstance() throws {
        let movieList = MovieList(movies: [], totalResults: "1", response: "True")
        XCTAssertNotNil(movieList)
    }
    
    func testProvideReturnUnmodifiedData() throws {
        /// Arrange
        let posterUrl = "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"
        let movie = Movie(title: "Title",
                          year: "2022",
                          imdbID: "tt0800369",
                          type: "movie",
                          poster: posterUrl)
        let movie2 = Movie(title: "Title2",
                          year: "2022",
                          imdbID: "tt0800368",
                          type: "movie",
                          poster: posterUrl)
        let movieList = MovieList(movies: [movie, movie2], totalResults: "2", response: "True")

        
        XCTAssertEqual(movieList.movies.count, 2 )
        XCTAssertEqual(movieList.totalResults, "2")
        XCTAssertEqual(movieList.response, "True")
    }
    
    func testMovieListFromJson() throws {
        /// Arrange
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "movie_list", withExtension: "json") else {
           XCTFail("Missing file: movie_list.json")
           return
         }
        let json = try Data(contentsOf: url)
          let decoder = JSONDecoder()
        /// Act
        let movieList = try decoder.decode(MovieList.self, from: json)
        
        /// Assert
        XCTAssertNotNil(movieList)
        XCTAssertEqual(movieList.movies.count, 10)
    }
}
