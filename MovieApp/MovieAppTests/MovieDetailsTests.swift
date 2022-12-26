//
//  MovieDetailsTests.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import XCTest

final class MovieDetailsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateInstance() throws {
        let posterUrl = "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"
        let movieDetails = MovieDetails(title: "Thor", year: "2022", rated: "PG-13", released: "Nov, 2022", runtime: "134 min", genre: "Horror, Comedy", director: "Director", writer: "Writer", actors: "salman khan", plot: "When thor sleeps..", language: "English", country: "Germany", awards: "Oscar", poster: posterUrl, ratings: [], metascore: "5", imdbRating: "4.5", imdbVotes: "566", imdbID: "tt1981115", type: "type", dvd: "dvd", boxOffice: "box", production: "prod", website: "n/a", response: "True")
        XCTAssertNotNil(movieDetails)
    }
    
    func testProvideReturnUnmodifiedMovieDetails() throws {
        /// Arrange
        let posterUrl = "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"
        let movieDetails = MovieDetails(title: "Thor", year: "2022", rated: "PG-13", released: "Nov, 2022", runtime: "134 min", genre: "Horror, Comedy", director: "Director", writer: "Writer", actors: "salman khan", plot: "When thor sleeps..", language: "English", country: "Germany", awards: "Oscar", poster: posterUrl, ratings: [], metascore: "5", imdbRating: "4.5", imdbVotes: "566", imdbID: "tt1981115", type: "type", dvd: "dvd", boxOffice: "box", production: "prod", website: "n/a", response: "True")
        
        XCTAssertEqual(movieDetails.title, "Thor" )
        XCTAssertEqual(movieDetails.year, "2022")
        XCTAssertEqual(movieDetails.rated, "PG-13")
    }
    
    func testMovieDetailsFromJson() throws {
        /// Arrange
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "movie_details", withExtension: "json") else {
           XCTFail("Missing file: movie_details.json")
           return
         }
        let json = try Data(contentsOf: url)
          let decoder = JSONDecoder()
        /// Act
        let movieDetails = try decoder.decode(MovieDetails.self, from: json)
        
        /// Assert
        XCTAssertNotNil(movieDetails)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
