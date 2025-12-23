import Foundation
import UIKit

class SplashViewController: UIViewController {
  let contentView = SplashView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    setupGesture()
    
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
    let loginBottomSheet = LoginBottomSheetViewController()
    loginBottomSheet.modalPresentationStyle = .overCurrentContext
    loginBottomSheet.modalTransitionStyle = .crossDissolve
    self.present(loginBottomSheet, animated: true) {
      loginBottomSheet.bottomSheetUp()
    }
  }
}
