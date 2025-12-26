import Foundation
import UIKit

// quem for se conformar com esse protocolo, precisa declarar essa função 
protocol LoginBottomSheetViewDelegate: AnyObject {
  func sendLoginData(user: String, Password: String)
}
