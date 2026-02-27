import UIKit

class ReminderCoordinator {
  
  // MARK: - Properties
  private var navigationController: UINavigationController?
  // MARK: - Splash
  // MARK: - Init
  public init() {
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - StartFlow
  func start() -> UINavigationController? {
    let startViewController = SplashViewController(splashFlowDelegate: self)
    self.navigationController = UINavigationController(rootViewController: startViewController)
    return navigationController
  }
}

// MARK: - Login

extension ReminderCoordinator: LoginBottomSheetFlowDelegate {
  func navigateToHome() {
    self.navigationController?.dismiss(animated: true)
    let viewController = UIViewController()
    viewController.view.backgroundColor = .red
    self.navigationController?.pushViewController(viewController, animated: true)
  }
}

// MARK: - Splash

extension ReminderCoordinator: SplashFlowDelegate {
  func openLoginBottomSheet() {
    let loginBottomSheet = LoginBottomSheetViewController(flowDelegate: self)
    loginBottomSheet.modalPresentationStyle = .overCurrentContext
    loginBottomSheet.modalTransitionStyle = .crossDissolve
    navigationController?.present(loginBottomSheet, animated: true) {
      loginBottomSheet.bottomSheetUp()
    }
  }
}
