//
//  PictureService.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 14.12.2023.
//

import Foundation

struct PictureService {
    
    let dataTask = BaseNetworkTask<EmptyModel, [PictureResponseModel]>(isNeedInjectToken: true, method: .get, path: "picture/")
    
    func loadPictures (_ onResponceWasRecieved: @escaping (_ result: Result<[PictureResponseModel], Error>) -> Void) {
        dataTask.perfomRequest(onResponceWasRecieved)
    }
}
