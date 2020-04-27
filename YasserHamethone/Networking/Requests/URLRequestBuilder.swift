//
//  RequestBuilderProtocol.swift
//  Hajij
//
//  Created by Enas Abdallah on 3/25/20.
//  Copyright © 2020 Neoxero. All rights reserved.
//
import Foundation
import Alamofire

//
let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtby5oYWpqZWouY29tXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNTg1NzM1Mjg2LCJleHAiOjM0Nzc4OTUyODYsIm5iZiI6MTU4NTczNTI4NiwianRpIjoibWlsZGNyZ2RlYzBwdEJWaCIsInN1YiI6NCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.nM__qf7Kk_4vKt-oHS8KS6cemf98Dty5vzZnDz1O2Wc"
let superVisorToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtby5oYWpqZWouY29tXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNTg2MjU0MTc2LCJleHAiOjM0Nzg0MTQxNzYsIm5iZiI6MTU4NjI1NDE3NiwianRpIjoiWFo1WlkzeHZqNTVyZTJqTyIsInN1YiI6MywicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.YFfbEWs2FcNDx0iL3Q4qNu1cxD_mL3XTtt2N8TgoeNE"



protocol URLRequestBuilder: URLRequestConvertible, APIRequestHandler {
    
    var mainURL: URL { get }
    var requestURL: URL { get }
    
    
    // MARK: - Path
    var path: String { get }
    
    // MARK: - Parameters
    var parameters: Parameters? { get }
    
    // MARK: - Methods
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
}


extension URLRequestBuilder {
  
    var encoding: ParameterEncoding {
           switch method {
           case .put:
               return JSONEncoding.default
           case .get :
                  return URLEncoding.default
           default:
               return JSONEncoding.default
           }
       }
       
    
    var mainURL: URL  {
        return URL(string: "https://corona.lmao.ninja/v2/")!
    }
    
    var requestURL: URL {
        return mainURL.appendingPathComponent(path)
    }
    
    
    var header:HTTPHeaders{
           var header = HTTPHeaders()
           
         // header["lang"] = L102Language.currentAppleLanguage()
           
//           if SaveUserDefault.getAuthenticationCode() != ""{
               header["Authorization"] = "bearer \(token)"

               
//           }else{
//              return header
//
//           }
//           print(header)

           return header
       }
       
       
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
      //  header.forEach { request.addValue($0.value, forHTTPHeaderField: $0.name) }
print(request)
        return request
    }
    
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
