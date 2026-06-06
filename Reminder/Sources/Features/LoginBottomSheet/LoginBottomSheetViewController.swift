import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
  let loginView = LoginBottomSheetView()
  let viewModel = LoginBottomSheetViewModel()
  var handleAreaHeight: CGFloat = 50.0
  public weak var flowDelegate: LoginBottomSheetFlowDelegate?
  
  init(flowDelegate: LoginBottomSheetFlowDelegate) {
    self.flowDelegate = flowDelegate
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loginView.delegate = self // instanciado e inicializando nessa classe, agora essa classe é obrigada a chamar a função do delegate
    initialize()
    bindViewModel()
  }
  
  func initialize() {
    self.view.addSubview(loginView)
    loginView.translatesAutoresizingMaskIntoConstraints = false
    setupConstraints()
    setupGesture()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
    ])
    
    let heightConstant = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    
  }
  
  private func setupGesture() {
    
  }
  // método que vai mapear cliques na tela, reconhecer o movimento
  private func handlePanGesture() {
    
  }
  
  private func bindViewModel() {
    viewModel.successResult = { [weak self] in
      self?.flowDelegate?.navigateToHome()
    }
  }
  
  
  // animar a BS,
  // quem chama o bottomSheetUp, pode passar um completion pra ele; pode ainda executar uma ação, ele pode fazer algo que vai completar uma ação
  //da classe
  // ; completion do tipo closure.. vai executar uma ação alem do que tá dentro da função
  // quando chamar o animate show, colocamos algo pra ser executado no bloco de código la em baixo
  func bottomSheetUp(completion: (() -> Void)? = nil) {
    //vai dar um update no layout
    self.view.layoutIfNeeded()
    // pegar a altura
    loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
    UIView.animate(withDuration: 0.3, animations: {
      self.loginView.transform = .identity
      self.view.layoutIfNeeded()
    }) { (_) in
      completion?()
    }
  }
}


extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
  func sendLoginData(user: String, password: String) {
//    print(user, password)
    viewModel.doAuth(emailLogin: user, passwordLogin: password)
    
  }
}
