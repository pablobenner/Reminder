import Foundation
import Firebase

class LoginBottomSheetViewModel {
  //criar outra closure, vai devolver pra nos um bloco de execução
  var successResult: (() -> Void)?
  //auth vai fazer a autenticação / requisição
  func doAuth(emailLogin: String, passwordLogin: String) {
    print(emailLogin)                                          //utilizar closure, fazer uma ação assim que o usuario se autenticar
    Auth.auth().signIn(withEmail: emailLogin, password: passwordLogin) { [weak self] authResult, error in
      if let error = error {
        print("deu erro \(error)")
      } else {
        print(authResult, "autenticado com sucesso")
        self?.successResult?()
      }
    }
  }
}
