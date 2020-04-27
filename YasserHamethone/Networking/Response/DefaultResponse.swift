//
//  DefaultResponse.swift
//  Hajij
//
//  Created by Enas Abdallah on 3/25/20.
//  Copyright © 2020 Neoxero. All rights reserved.
//

import Foundation

/// Default response to check for every request since this's how this api works. 
struct DefaultResponse: Codable, CodableInit {
    var status: Int
}
