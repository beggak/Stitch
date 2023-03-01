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
            $0.height.equalTo(84)
            $0.width.equalToSuperview()
        }
        
        imageLogo.snp.makeConstraints {
            $0.width.equalTo(98)
            $0.height.equalTo(37)
            $0.leading.equalToSuperview().offset(35)
            $0.top.equalToSuperview().offset(35)
        }
    }
    public func configureNavigationBar() {
        navigationBar = UINavigationBar.init()
        navigationBar.backgroundColor = .systemGreen
        navigationBar.addSubview(imageLogo)
        self.addSubview(navigationBar)
    }
    public func configureImageLogo() {
        imageLogo = .init(
            image: UIImage(
                named: "stitch")!)
    }
    
}
