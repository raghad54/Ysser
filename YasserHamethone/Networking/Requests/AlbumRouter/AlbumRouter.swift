//
//  AlbumRouter.swift
//  Hajij
//
//  Created by Raghad'Mac on 4/9/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import Alamofire
import ARSLineProgress

class AlbumRouter{
    static func fetchGalleryData(completion:@escaping (Gallery?, AFError?) -> Void){
        ARSLineProgress.show()
        AF.request(ApiRouter.Gallery, interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
            ARSLineProgress.hide()
            switch responce.result{
            case .success(let value):
                if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
                    let decoder = JSONDecoder()
                    do {
                        
                        let galleryDataFetched = try decoder.decode(Gallery.self, from: data)
                        completion(galleryDataFetched , nil)
                    }catch{
                        completion(nil ,nil)
                    }
                    
                }else{
                    completion(nil , nil)
                }
            case .failure(let error):
                completion(nil , error)
            }
            
        }
        
    }
    
    
    static func fetchAlbumImagesData(albumId:Int,completion:@escaping (AlbumImage?, AFError?) -> Void){
        ARSLineProgress.show()
        AF.request(ApiRouter.AlbumImages(albumId: albumId), interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
            ARSLineProgress.hide()
            switch responce.result{
            case .success(let value):
                if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
                    let decoder = JSONDecoder()
                    do {
                        
                        let albumImageDataFetched = try decoder.decode(AlbumImage.self, from: data)
                        completion(albumImageDataFetched , nil)
                    }catch{
                        completion(nil ,nil)
                    }
                    
                }else{
                    completion(nil , nil)
                }
            case .failure(let error):
                completion(nil , error)
            }
            
        }
        
    }
    
    
    static func fetchAllImages(completion:@escaping (AllImages?, AFError?) -> Void){
        ARSLineProgress.show()
        AF.request(ApiRouter.AllImages, interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
            ARSLineProgress.hide()
            switch responce.result{
            case .success(let value):
                if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
                    let decoder = JSONDecoder()
                    do {
                        
                        let allImagesDataFetched = try decoder.decode(AllImages.self, from: data)
                        completion(allImagesDataFetched , nil)
                    }catch{
                        completion(nil ,nil)
                    }
                    
                }else{
                    completion(nil , nil)
                }
            case .failure(let error):
                completion(nil , error)
            }
            
        }
        
    }
}



