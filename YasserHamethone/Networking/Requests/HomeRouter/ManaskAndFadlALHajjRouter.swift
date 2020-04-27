//
//  HajjNewsRouter.swift
//  Hajij
//
//  Created by Raghad'Mac on 4/8/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import Alamofire
import ARSLineProgress



//class ManaskAndFadlALHajjRouter{
//
//    static func fetchFadlHajj(completion:@escaping (FadlALHajj?, AFError?) -> Void){
//        ARSLineProgress.show()
//        AF.request(ApiRouter.fadlAlHajj, interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
//            ARSLineProgress.hide()
//            switch responce.result{
//            case .success(let value):
//                if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
//                    let decoder = JSONDecoder()
//                    do {
//
//                        let ManskAlHajjDataFetched = try decoder.decode(FadlALHajj.self, from: data)
//                        completion(ManskAlHajjDataFetched , nil)
//                    }catch{
//                        completion(nil , nil)
//                    }
//
//                }else{
//                    completion(nil , nil)
//                }
//            case .failure(let error):
//                completion(nil , error)
//            }
//
//        }
//
//    }
//    
//    
//    static func fetchManaskALHajj(completion:@escaping (ManaskALHajj?, AFError?) -> Void){
//           ARSLineProgress.show()
//        AF.request(ApiRouter.manaskAlHajj, interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
//               ARSLineProgress.hide()
//               switch responce.result{
//               case .success(let value):
//                   if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
//                       let decoder = JSONDecoder()
//                       do {
//
//                           let ManskAlHajjDataFetched = try decoder.decode(ManaskALHajj.self, from: data)
//                           completion(ManskAlHajjDataFetched , nil)
//                       }catch{
//                           completion(nil , nil)
//                       }
//
//                   }else{
//                       completion(nil , nil)
//                   }
//               case .failure(let error):
//                   completion(nil , error)
//               }
//
//           }
//
//       }
//}
