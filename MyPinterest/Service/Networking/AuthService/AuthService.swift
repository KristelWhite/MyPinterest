//
//  AuthService.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 12.12.2023.
//

import Foundation

struct AuthService {
    
    let dataTask = BaseNetworkTask< AuthRequestModel, AuthResponseModel >(isNeedInjectToken: false, method: .post, path: "auth/login/")
    
    func performLoginRequestAndSaveToken( credentials: AuthRequestModel, _ onResponseWasReseived: @escaping ( _ result: Result<AuthResponseModel, Error> ) -> Void) {
        dataTask.perfomRequest(input: credentials) { result in
            if case let .success(responceModel) = result {
                try? dataTask.tokenStorage.set(newToken: TokenContainer(token: responceModel.token, receivingDate: Date()))
            }
            onResponseWasReseived(result)
        }
        
        
    }
}
