//import UIKit
//import RxSwift
//
//internal class LogInController: BaseViewController<LogInView, LogInViewModel> {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        contentView.button.rx.tap.subscribe(onNext: { [weak self] in
//            self?.viewModel.steps.accept(AppStep.login)
//        }).disposed(by: disposableBag)
//    }
//}
//
//

import UIKit
import RxSwift

internal class LogInController: BaseViewController<LogInView, LogInViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private var inputs: LogInViewModel.Input {
        return LogInViewModel.Input(nextTrigger: contentView.button.rx.tap.asDriver())
    }
    
    private func bind(output: LogInViewModel.Output) {
        disposableBag.insert([
            output.nextTapped.drive(),
            viewModel.onErrorHandling
                .skip(1)
                .subscribe { error in
                    print(error)
                }
        ])
    }
}


