import RxSwift
import RxCocoa
import Foundation

protocol AuthServiceProtocol: AnyObject {
    func signIn(by name: String) -> Single<String>
}

public class AuthenticationService: AuthServiceProtocol {
    
    func signIn(by name: String) -> Single<String> {
        
        enum LogInError: Error {
            case emptyName
        }
        return Single.create { single in
            let disposable = Disposables.create()
            guard name.count > 0 else {
                single(.error(LogInError.emptyName))
                return disposable
            }
            single(.success(name))
            return disposable
        }
    }
}
