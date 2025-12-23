import Foundation
import UIKit

class LoginBottomSheetView: UIView {
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "loginToAcessYourData".localized
    // setando true pra usar gesture
    label.isUserInteractionEnabled = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label 
  }()
  
  private let handleArea: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    view.layer.cornerRadius = Metrics.tiny
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let emailTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "emailExample".localized
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "password".localized
    textField.borderStyle = .roundedRect
    textField.isUserInteractionEnabled = true
    textField.isSecureTextEntry = true
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("login".localized, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = Colors.primaryRedBase
    button.layer.cornerRadius = Metrics.tiny
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initializer()
    
    let exampleGest = UITapGestureRecognizer(target: self, action: #selector(exampleTapped))
    titleLabel.addGestureRecognizer(exampleGest)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc private func exampleTapped(){
    print("clicou na label")
    
  }
  
  private func initializer(){
    self.backgroundColor = .white
    self.layer.cornerRadius = Metrics.small
    setupConstraints()
  }
  
  private func setupConstraints(){
    addSubview(handleArea)
    addSubview(titleLabel)
    addSubview(emailTextField)
    addSubview(passwordTextField)
    addSubview(loginButton)
    
    NSLayoutConstraint.activate([
      //self.top ancher é a top anchor da classe loginbottomsheetview que é uma uiview
      handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
      handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      handleArea.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 40),
      handleArea.heightAnchor.constraint(equalToConstant: 6),
      
      titleLabel.topAnchor.constraint(equalTo: handleArea.topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: handleArea.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: handleArea.trailingAnchor, constant: -20),
      
      emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
      emailTextField.leadingAnchor.constraint(equalTo: handleArea.leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: handleArea.trailingAnchor, constant: -20),
      
      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
      passwordTextField.leadingAnchor.constraint(equalTo: handleArea.leadingAnchor, constant: 20),
      passwordTextField.trailingAnchor.constraint(equalTo: handleArea.trailingAnchor, constant: -20),
      
      loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
      loginButton.leadingAnchor.constraint(equalTo: handleArea.leadingAnchor, constant: 20),
      loginButton.trailingAnchor.constraint(equalTo: handleArea.trailingAnchor, constant: -20)
      
    ])
  }
  
}
