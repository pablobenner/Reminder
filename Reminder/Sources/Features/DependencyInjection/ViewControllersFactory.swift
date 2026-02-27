import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
  func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
    let viewController = SplashViewController(splashFlowDelegate: flowDelegate)
    return viewController
  }
  
  func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
    let viewController = LoginBottomSheetViewController(flowDelegate: flowDelegate)
    return viewController
  }
  
  
}
