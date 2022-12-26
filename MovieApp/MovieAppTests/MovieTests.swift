//
//  MovieTests.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import XCTest

final class MovieTests: XCTestCase {

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
    func testCreateInstance() throws{
        let movie = Movie(title: "Title",
                          year: "2022",
                          imdbID: "tt0800369",
                          type: "movie",
                          poster: "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg")
        XCTAssertNotNil(movie)
    }
    
    func testMovieFromJson() throws {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "movie", withExtension: "json") else {
           XCTFail("Missing file: movie.json")
           return
         }
        let json = try Data(contentsOf: url)
          let decoder = JSONDecoder()
        let movie = try decoder.decode(Movie.self, from: json)
        let posterUrl = "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie.title, "Thor")
        XCTAssertEqual(movie.year, "2011")
        XCTAssertEqual(movie.type, "movie")
        XCTAssertEqual(movie.poster, posterUrl)
    

    }

}
