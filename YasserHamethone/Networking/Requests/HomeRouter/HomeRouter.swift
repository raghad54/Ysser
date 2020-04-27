//
//  HomeRouter.swift
//  Hajij
//
//  Created by Raghad'Mac on 4/7/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import Alamofire
import ARSLineProgress




class HomeRouter{
    
    
    
//
    static func fetchHome(completion:@escaping (KsaState?, AFError?) -> Void){
        ARSLineProgress.show()
        AF.request(ApiRouter.ksaState, interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
            ARSLineProgress.hide()
            switch responce.result{
            case .success(let value):
                if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
                    let decoder = JSONDecoder()
                    do {

                        let homeDataFetched = try decoder.decode(KsaState.self, from: data)
                        completion(homeDataFetched , nil)
                    }catch{
                        completion(nil , nil)
                    }

                }else{
                    completion(nil , nil)
                }
            case .failure(let error):
                completion(nil , error)
            }

        }

    }
    
    static func fetchHomeAllCasess(completion:@escaping (AllCases?, AFError?) -> Void){
        ARSLineProgress.show()
        AF.request(ApiRouter.allWorld, interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
            ARSLineProgress.hide()
            switch responce.result{
            case .success(let value):
                if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
                    let decoder = JSONDecoder()
                    do {

                        let homeDataFetched = try decoder.decode(AllCases.self, from: data)
                        completion(homeDataFetched , nil)
                    }catch{
                        completion(nil , nil)
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
  
