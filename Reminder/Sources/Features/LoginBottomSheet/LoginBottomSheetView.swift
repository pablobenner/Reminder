import Foundation
import UIKit

class LoginBottomSheetView: UIView {
  public weak var delegate: LoginBottomSheetViewDelegate?
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "loginToAcessYourData".localized
    label.font = .systemFont(ofSize: 20, weight: .bold)
    // setando true pra usar gesture
    label.isUserInteractionEnabled = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label 
  }()
  
  private let emailLabel: UILabel = {
    let label = UILabel()
    label.text = "email".localized
    label.isUserInteractionEnabled = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let passwordLabel: UILabel = {
    let label = UILabel()
    label.text = "passwordLabel".localized
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
    textField.layer.borderWidth = 3
    textField.layer.borderColor = UIColor.systemGray.cgColor
    textField.layer.cornerRadius = Metrics.tiny
    return textField
  }()
  
  private let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "password".localized
    textField.borderStyle = .roundedRect
    textField.isUserInteractionEnabled = true
    textField.isSecureTextEntry = true
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.borderWidth = 3
    textField.layer.borderColor = UIColor.systemGray.cgColor
    textField.layer.cornerRadius = Metrics.tiny
    return textField
  }()
  
  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("login".localized, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
    button.backgroundColor = Colors.primaryRedBase
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.titleLabel?.textColor = .white
    button.setTitleColor(.white, for: UIControl.State.normal)
    button.layer.cornerRadius = 25
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initializer()
    
    //testando um gesture
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
    addSubview(emailLabel)
    addSubview(passwordLabel)
    
    NSLayoutConstraint.activate([
      //self.top ancher é a top anchor da classe loginbottomsheetview que é uma uiview
      
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.medium),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      
      emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
      emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      
      emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Metrics.small),
      emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
      emailTextField.heightAnchor.constraint(equalToConstant: Metrics.huge),
    
      passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
      passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      
      passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Metrics.small),
      passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
      passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.huge),
      
      loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.huge),
      loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
      loginButton.heightAnchor.constraint(equalToConstant: 60),
      
      
    ])
  }
  
  @objc private func loginButtonDidTapped() {
    guard let user = emailTextField.text, let password = passwordTextField.text else {
      return
    }
    delegate?.sendLoginData(user: user, Password: password)
    
  }
}


//guard let user = emailTextField.text else { return }
