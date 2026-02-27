import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
  func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
  func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
}
