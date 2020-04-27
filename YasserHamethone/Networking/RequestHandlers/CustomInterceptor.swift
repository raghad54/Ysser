//
//  CustomInterceptor.swift
//  Hajij
//
//  Created by Enas Abdallah on 4/1/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import Alamofire

class CustomInterceptor:RequestInterceptor{
    
    private let xApIToken = "Bearer"
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var urlRequest = urlRequest
        
        if  let urlString = urlRequest.url?.absoluteString , urlString.contains("/v2"){
            
            urlRequest.addValue(xApIToken, forHTTPHeaderField: "Authorization")
            print(urlString)
        }
        
        completion(.success(urlRequest))
    }
    
}
