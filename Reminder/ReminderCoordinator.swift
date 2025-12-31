import UIKit

class ReminderCoordinator {
  
  // MARK: - Properties
  private var navigationController: UINavigationController?
  // MARK: - Splash
  // MARK: - Login
  // MARK: - Init
  public init() {
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - StartFlow
  func start() -> UINavigationController? {
    let startViewController = SplashViewController()
    self.navigationController = UINavigationController(rootViewController: startViewController)
    return navigationController
  }
}
