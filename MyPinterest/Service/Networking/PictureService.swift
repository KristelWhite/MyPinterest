//
//  PictureService.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 14.12.2023.
//

import Foundation

struct PictureService {
    
    let dataTask = BaseNetworkTask<EmptyModel, PicturesResponseModel>(isNeedInjectToken: true, method: .get, path: "picture/")
    
    func loadPictures (_ onResponceWasRecieved: @escaping (_ result: Result<PicturesResponseModel, Error>) -> Void) {
        dataTask.perfomRequest(onResponceWasRecieved)
    }
}
