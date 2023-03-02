import RxSwift
import RxRelay
import RxFlow

enum AppStep: Step {
    case login
    case movies
}

class AppStepper: Stepper {
    var steps: PublishRelay<Step> = .init()
    
    var initialStep: Step {
        return AppStep.login
    }
}
