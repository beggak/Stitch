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
        button.backgroundColor = .systemGreen
        button.setTitle("Log In", for: .normal)
        addSubview(button)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        textField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(48)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(50)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(48)
        }
    }
}
