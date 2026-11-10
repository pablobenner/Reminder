import Foundation
import UIKit

// quem for se conformar com esse protocolo, precisa declarar essa função... no caso vai pegar esses dados de algum lugar
protocol LoginBottomSheetViewDelegate: AnyObject {
  func sendLoginData(user: String, password: String)
}
