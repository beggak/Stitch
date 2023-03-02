import UIKit
import RxSwift

internal class LogInController: BaseViewController<LogInView, LogInViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(output: viewModel.transform(input: inputs))
    }
    
    private var inputs: LogInViewModel.Input {
        return LogInViewModel.Input(nextTrigger: contentView.button.rx.tap.asDriver(),
                                    requisite: contentView.textField.rx.text.orEmpty.asDriver())
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


