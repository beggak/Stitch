import UIKit
import RxSwift

internal class LogInController: BaseViewController<LogInView, LogInViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        contentView.button.rx.tap.subscribe(onNext: { [weak self] in
            self?.viewModel.steps.accept(AppStep.login)
        }).disposed(by: disposableBag)
    }
}


