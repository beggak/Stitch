import Foundation
import RxSwift
import RxFlow
import RxCocoa

internal class MoviesViewModel: BaseViewModel, Stepper {
    var steps = PublishRelay<Step>.init()
    var onErrorHandling: BehaviorRelay<Error?> = .init(value: nil)
    var moviesModel: BehaviorRelay<[MoviesSectionModel]> = .init(value: [])
    weak var service: MoviesService?
    
    init(service: MoviesService?) {
        self.service = service
    }
    
    var initialStep: Step {
        return AppStep.movies
    }

}

extension MoviesViewModel: ViewModelType {
    struct Input {
        let itemSelected: Driver<Void>
    }
    
    struct Output {
        let sections: Driver<Void>
    }
  
    func transform(input: Input) -> Output {
        let movieInfo = input.itemSelected.asDriver(onErrorJustReturn: ())
        return Output(sections: movieInfo)
    }
}
