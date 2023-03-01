import UIKit
import RxSwift
import RxFlow

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let disposeBag = DisposeBag()
    let coordinator: FlowCoordinator = .init()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        self.coordinator.rx.willNavigate.subscribe(onNext: { (flow, step) in
              print("will navigate to flow = \(flow) and step = \(step)")
          }).disposed(by: self.disposeBag)

        self.coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
              print("did navigate to flow = \(flow) and step = \(step)")
          }).disposed(by: self.disposeBag)
        
        let appFlow = AppFlow()
        Flows.whenReady(flow1: appFlow) { [weak self] root in
            self?.window?.rootViewController = root
            self?.window?.makeKeyAndVisible()
        }
        coordinator.coordinate(flow: appFlow, with: AppStepper())
        return true
    }
}

