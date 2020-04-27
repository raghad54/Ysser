//
//  Absence.swift
//  Hajij
//
//  Created by Raghad'Mac on 4/21/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import Alamofire
import ARSLineProgress

class AbsenceRouter{
    
    
    static func fetchBusHajij(completion:@escaping (BusHajij?, AFError?) -> Void){
        ARSLineProgress.show()
        AF.request(ApiRouter.busHajij, interceptor: CustomInterceptor()).responseJSON { (responce:AFDataResponse<Any>)  in
            ARSLineProgress.hide()
            switch responce.result{
            case .success(let value):
                if let jsonData = value as? [String:Any] , let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
                    let decoder = JSONDecoder()
                    do {
                        
                        let busHajijDataFetched = try decoder.decode(BusHajij.self, from: data)
                        completion(busHajijDataFetched , nil)
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
    
