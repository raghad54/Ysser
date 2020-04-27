//
//  ProjectRouter.swift
//  Hajij
//
//  Created by Enas Abdallah on 3/25/20.
//  Copyright © 2020 Neoxero. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestBuilder {
    
    case ksaState
    case allWorld
   
    
    
    // MARK: - Path
    internal var path: String {
        switch self {
        case .ksaState:
            return "countries/sa"
       
        case .allWorld:
            return "all"
        }
    }
    
    // MARK: - Parameters
    internal var parameters: Parameters? {
        var params = Parameters.init()
        switch self {
   
        case .ksaState:
            params[""] = ""
            case .allWorld:
            params[""] = ""
       
        }
        return params
    }
    
    // MARK: - Methods
    internal var method: HTTPMethod {
        switch self {
        case .ksaState:
            return .get
            case .allWorld:
            return .get
        
            
        }
    }
    
    
    
    
}
