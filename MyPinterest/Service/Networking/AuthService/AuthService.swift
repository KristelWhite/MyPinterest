//
//  AuthService.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 12.12.2023.
//

import Foundation

struct AuthService {
    
    let dataTask = BaseNetworkTask< AuthRequestModel, AuthResponseModel >(isNeedInjectToken: false, method: .post, path: "auth/login/")
    
    func performLoginRequest( credentials: AuthRequestModel, _ onResponseWasReseived: @escaping ( _ result: Result<AuthResponseModel, Error> ) -> Void) {
        dataTask.perfomRequest(input: credentials, onResponseWasReseived)
    }
}
