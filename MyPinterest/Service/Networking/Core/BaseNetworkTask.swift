//
//  BaseNetworkTask.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 12.12.2023.
//

import Foundation
 
struct BaseNetworkTask<AbstractInput: Encodable, AbstractOutput: Decodable> : NetworkTask {

//    MARK: - NetworkTask
    
    typealias Input = AbstractInput
    typealias Output = AbstractOutput
    
    var baseURL: URL? {
        URL(string: "https://pictures.chronicker.fun/api")
    }
    var path: String
    var method: NetworkMethod
    var session : URLSession = URLSession(configuration: .default)
    var isNeedInjectToken : Bool
    
    var tokenStorage: TokenStorage {
        BaseTokenStorage()
    }
    
//    MARK: - Initialization
    
    init(isNeedInjectToken: Bool, method: NetworkMethod, path: String) {
        self.isNeedInjectToken = isNeedInjectToken
        self.path = path
        self.method = method
    }
//    MARK: - NetworkTask method
    
    func perfomRequest(input: Input, _ onResponseWasReseived: @escaping ( _ result: Result<Output, Error> ) -> Void)
    {
        do {
            let request = try getRequest(with: input)
            session.dataTask(with: request) { data, responce, error in
                if let error = error {
                    onResponseWasReseived(.failure(error))
                } else if let data = data {
                    do {
                        let result = try JSONDecoder().decode(AbstractOutput.self, from: data)
                        onResponseWasReseived(.success(result))
                    } catch {
                        onResponseWasReseived(.failure(error))
                    }
                } else {
                    onResponseWasReseived(.failure(NetworkTaskError.unknownError))
                }
            }
            .resume()
        } catch {
            onResponseWasReseived(.failure(error))
        }
        
    }
       
}

extension BaseNetworkTask where AbstractInput == EmptyModel {
    func perfomRequest(_ onResponseWasReseived: @escaping ( _ result: Result<Output, Error> ) -> Void) {
        perfomRequest(input: EmptyModel(), onResponseWasReseived)
    }
}


private extension BaseNetworkTask {
    
//     MARK: - Error
    
    enum NetworkTaskError: Swift.Error {
        case urlWasNotFound
        case urlComponentNotCreated
        case parametersIsNotValidJSONObject
        case unknownError
    }
    
//    MARK: -
    
    func getRequest(with parameters: AbstractInput) throws -> URLRequest {
        guard let url = completedURL else { throw NetworkTaskError.urlWasNotFound }
        
        var request : URLRequest
    
        switch method {
        case .get:
            let newURL = try getURLWithQueryParameters(url: url, parameters: parameters)
            request = URLRequest(url: newURL)
        case .post:
            request = URLRequest(url: url)
            request.httpBody = try getBodyParameters(with: parameters)
        }
        request.httpMethod = method.getMethod()
//в каком формате мы отправляем или получаем данные
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if isNeedInjectToken {
            request.addValue("Token \(try tokenStorage.getToken())", forHTTPHeaderField: "Authorization")
        }
        return request
        
    }
    
    func getBodyParameters( with encodableParameters: AbstractInput ) throws -> Data {
        return try JSONEncoder().encode(encodableParameters)
    }
    
    func getURLWithQueryParameters(url: URL, parameters: AbstractInput) throws -> URL {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw NetworkTaskError.urlComponentNotCreated
        }
        
        let parametersOnDataRepresentation = try JSONEncoder().encode(parameters)
        let parametersOnDictionaryRepresentation = try JSONSerialization.jsonObject(
            with: parametersOnDataRepresentation) as? [String : Any]
        
        guard let parametersForComponents = parametersOnDictionaryRepresentation else {
            throw NetworkTaskError.parametersIsNotValidJSONObject
        }
        
        urlComponents.queryItems = parametersForComponents.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
        
        guard let newUrlWithQuery = urlComponents.url else {
            throw NetworkTaskError.urlWasNotFound
        }
        return newUrlWithQuery
    }
}


//0) Что такое сериализация
//1)
//2) что будет если я передам в параметрс строку которая вполне декодируется в json
//3) что будет если я передам в параметрс json

