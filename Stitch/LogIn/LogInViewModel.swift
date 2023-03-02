import Foundation
import RxFlow
import RxSwift
import RxCocoa

internal class LogInViewModel: BaseViewModel, Stepper {
    var steps = PublishRelay<Step>.init()
    var name: BehaviorRelay<String> = .init(value: "")
    var onErrorHandling: BehaviorRelay<Error?> = .init(value: nil)
    weak var service: AuthenticationService?
    
    init(service: AuthenticationService?) {
        self.service = service
    }
    
    var initialStep: Step {
        return AppStep.login
    }
    
    private func logIn() {
        guard !name.value.isEmpty else { return }
        service?.signIn(by: name.value)
            .subscribe{ [weak self] _ in
                self?.steps.accept(AppStep.login)
            } onError: { [weak self] error in
                self?.onErrorHandling.accept(error)
            }.disposed(by: disposeBag)
    }
}

extension LogInViewModel: ViewModelType {
    struct Input {
        let logInButton: Driver<Void>
    }
    
    struct Output {
        let logInTapped: Driver<Void>
    }
    
    func transform(input: Input) -> Output {
        let nextScreen = input.logInButton
            .asDriver(onErrorJustReturn: ())
        return Output(logInTapped: nextScreen)
    }
}
