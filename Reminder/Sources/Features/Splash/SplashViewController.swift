import Foundation
import UIKit

class SplashViewController: UIViewController {
  let contentView = SplashView()
  public weak var splashFlowDelegate: SplashFlowDelegate?
  
  init(splashFlowDelegate: SplashFlowDelegate) {
    self.splashFlowDelegate = splashFlowDelegate
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupGesture()
    startTimeAnimation()
//    decideDestiny()
    setup()
    
  }
  
  private func decideDestiny() {
    // verif. se existe esse usuario, se existe, ele vai criar user //// só vai entrar aqui se issaved for true
    if let user = UserDefaultsManager.loadUser(), user.isUserSaved {
      splashFlowDelegate?.navigateToHome()
    } else {
      handleTouchBottomSheet()
    }
  }
  
  private func setup() {
    self.view.addSubview(contentView)
    setupConstraints()
    self.navigationController?.navigationBar.isHidden = true
    self.view.backgroundColor = Colors.primaryRedBase
  }
  
  private func setupGesture() {     // target é a propria classe que tamo utilizando
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTouchBottomSheet))
    //adicionando o gesture que criamos
    self.view.addGestureRecognizer(tapGesture)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      //linha de baixo, o topo da content view encosta no topo da view padrao
      contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
  }
  
  @objc private func handleTouchBottomSheet() {
    animateLogoUp()
    splashFlowDelegate?.openLoginBottomSheet()
  }
}

// MARK: - Animations
extension SplashViewController {
  private func startTimeAnimation() {
    UIView.animate(withDuration: 1.0,
                   delay: 0.0,
                   animations: {
      self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }, completion:  {_ in
      self.decideDestiny()
    })
  }
  
  private func animateLogoUp() {
    UIView.animate(withDuration: 1.0,
                   delay: 0.0,
                   options: [.curveEaseInOut],
                   animations: {
      self.contentView.logoImageView.transform = self.contentView.logoImageView.transform.translatedBy(x: 0, y: -100)
    }, completion: nil)

  }
}
