//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Pablo Benner on 13/11/26.
//



import Foundation

class UserDefaultsManager {
    //static let é pras func static conseguirem ler, sem ter que dar init.
    private static let userKey = "userKey"
    
    static func saveUser(user: User) {
        let encoder = JSONEncoder() // 1. pega a máquina de empacotar
        // Serialização: Transforma a struct User no tipo 'Data'
        // empacota a struct User transformando em bytes (Data)
        if let encoded = try? encoder.encode(user) {
            // salva esse pacote no disco do iPhone com a etiqueta "userKey":
            UserDefaults.standard.set(encoded, forKey: userKey)
            // força o iPhone a gravar no disco imediatamente:
            UserDefaults.standard.synchronize()
        }
    }
    
    static func loadUser() -> User? {
        // 1. abre o disco do iPhone e procura se tem algo com a etiqueta "userKey":
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            let decoder = JSONDecoder() // 2. Pega a máquina de desempacotar
            // 3. transforma os bytes do disco de volta para a struct User:
            if let user = try? decoder.decode(User.self, from: userData) {
                return user // se achar, devolve o usuário logado
            }
        }
        
        // 4. se a caixinha estava vazia (primeira vez abrindo o app), devolve nil (nada):
        return nil
    }
}



//O UserDefaults é a API da Apple para salvar dados simples no disco do iOS (formato chave-valor).
//
//No entanto, o UserDefaults possui uma restrição rígida de tipos: ele só aceita tipos primitivos nativos da Apple:
//
//String
//Int, Double, Float
//Bool
//Data (bytes binários)
//Array e Dictionary (contendo apenas esses tipos primitivos)
//
//Ele não aceita uma struct customizada que você criou (como User). Se você tentar passar UserDefaults.standard.set(user, forKey: "user"), o compilador dará erro porque ele não sabe o que é User.
//
//A solução técnica: Ao assinar o protocolo Codable (que combina Encodable e Decodable), você permite que o compilador do Swift converta essa struct inteira em um buffer binário do tipo Data (bytes em formato JSON), que o UserDefaults aceita nativamente.
