import Foundation
import UIKit

protocol HasMoviesService {
    var moviesService: MoviesService { get }
}

internal class MoviesService {
    func movies() -> [Movie] {
        return MoviesRepository.movies.filter { UIImage(named: $0.image) != nil }
    }
}
