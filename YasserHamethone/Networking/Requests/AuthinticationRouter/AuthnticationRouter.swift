//
//  AuthnticationRouter.swift
//  Hajij
//
//  Created by Raghad'Mac on 4/6/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import Alamofire
import ARSLineProgress



class AuthnticationRouter{
    
    static func login(email: String, password: String, completion:@escaping (Result<Login, AFError>)->Void) {
        ARSLineProgress.show()
           AF.request(ApiRouter.login(email: email, password: password))
                    .responseDecodable { (response: DataResponse) in
               completion(response.result)
           }
       }
    
//    static func logOut(completion:@escaping (Result<LogOut, AFError>)->Void){
//        AF.request(ApiRouter.logout).responseDecodable { (response: DataResponse) in
//                    completion(response.result)
//       }
//    }
    
//    static func checkUserResponsbility(completion:@escaping (Result<UserResponsibility, AFError>)->Void){
//        AF.request(ApiRouter.checkUserResponsibility).responseDecodable { (response: DataResponse) in
//                       completion(response.result)
//          }
//       }
    
    
    static func gotToLogOut(completion:@escaping (LogOut?, AFError?) -> Void){
                 ARSLineProgress.show()
           AF.request(ApiRouter.logout, interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
                     ARSLineProgress.hide()
                     switch responce.result{
                     case .success(let value):
                         if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
                             let decoder = JSONDecoder()
                             do {
                               let HajjNewsDetailsDataFetched = try decoder.decode(LogOut.self, from: data)
                                 completion(HajjNewsDetailsDataFetched , nil)
                             } catch{
                              //  let error = error.localizedDescription
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

    
    static func checkUserResponsbility(completion:@escaping (UserResponsibility?, AFError?) -> Void){
              ARSLineProgress.show()
        AF.request(ApiRouter.checkUserResponsibility, interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
                  ARSLineProgress.hide()
                  switch responce.result{
                  case .success(let value):
                      if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
                          let decoder = JSONDecoder()
                          do {
                             let HajjNewsDetailsDataFetched = try decoder.decode(UserResponsibility.self, from: data)
                              completion(HajjNewsDetailsDataFetched , nil)
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
    
