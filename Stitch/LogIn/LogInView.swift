import Foundation
import UIKit
import RxSwift

internal class LogInView: BaseView {
    
    public var textField: UITextField!
    public var button: UIButton!
    
    override func setUpView() {
        super.setUpView()
        textField = UITextField.init()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.systemPurple.cgColor
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        addSubview(textField)
        
        button = UIButton.init()
        button.layer.cornerRadius = 8
        button.backgroundColor = .green
        button.setTitle("Log In", for: .normal)
        addSubview(button)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        textField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(48)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(50)
            make.right.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(-20)
            make.height.equalTo(48)
        }
    }
}
