import UIKit
import SnapKit

open class BaseView: UIView {
    public var navigationBar: UINavigationBar!
    public var imageLogo: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setUpView()
        setUpConstraints()
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    public func setUpView() {
        configureImageLogo()
        configureNavigationBar()
    }
    
    public func setUpConstraints() {
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalToSuperview()
        }
        
        imageLogo.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(60)
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }
    public func configureNavigationBar() {
        navigationBar = UINavigationBar.init()
        navigationBar.backgroundColor = .systemBlue
        navigationBar.addSubview(imageLogo)
        self.addSubview(navigationBar)
    }
    public func configureImageLogo() {
        imageLogo = .init(
            image: UIImage(
                named: "stitch")!)
    }
    
}
