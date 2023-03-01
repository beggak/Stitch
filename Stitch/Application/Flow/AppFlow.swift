import RxFlow
import RxSwift
import RxRelay

class AppFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.navigationBar.isHidden = true
        return viewController
    }()
    
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .login:
            return navigateToLogin()
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        
        let service = AuthenticationService()

        let viewModel = LogInViewModel.init(service: service)
        let viewController = LogInController(viewModel: viewModel)

        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: viewController,
                                                 withNextStepper: viewController.viewModel))
    }
    
//    private func navigateToMovies() -> FlowContributors {
//        
//    }
}


