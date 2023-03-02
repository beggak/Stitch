//
//struct Movie {
//    let id: Int
//    let title: String
//    let description: String
//    let year: Int
//    let budget: Int
//    let director: String
//    let writer: String
//    let image: String
//    let watched: Bool
//}

import UIKit

struct Movie {
    public var title: String
    public var description: String
    public var image: String
}

struct MoviesRepository {
    static let movies = [Movie(title: "Star Trek Beyond",
                               description: MoviesDescription.startrekBeyondDescription,
                               image: "startrek"),
                         Movie(title: "Starwars: The force awakens",
                               description: MoviesDescription.starwarsDescription,
                               image: "starwars"),
                         Movie(title: "Avatar",
                               description: MoviesDescription.avatarDescription,
                               image: "avatar"),
                         Movie(title: "Blade Runner",
                               description: MoviesDescription.bladeRunnerDescription,
                               image: "bladerunner"),
                         Movie(title: "The Terminator",
                               description: MoviesDescription.terminatorDescription,
                               image: "terminator"),
                         Movie(title: "Predator",
                               description: MoviesDescription.predatorDescription,
                               image: "predator"),
                         Movie(title: "Dune",
                               description: MoviesDescription.duneDescription,
                               image: "dune"),
                         Movie(title: "First Constact",
                               description: MoviesDescription.firstContactDescription,
                               image: "firstcontact")]
}

