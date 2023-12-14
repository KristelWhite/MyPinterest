//
//  NetworkTask.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 12.12.2023.
//

import Foundation

protocol NetworkTask {
    
    associatedtype Input: Encodable
    associatedtype Output: Decodable
    
    var baseURL : URL? { get }
    var path : String { get }
    var completedURL : URL? { get }
    var method : NetworkMethod { get }
    
    func perfomRequest(input: Input, _ onResponseWasReseived: @escaping ( _ result: Result<Output, Error> ) -> Void)
}

extension NetworkTask {
    
    var completedURL: URL? {
        baseURL?.appendingPathExtension(path)
    }
    
}

