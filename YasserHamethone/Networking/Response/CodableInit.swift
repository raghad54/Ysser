//
//  CodableInit.swift
//  Hajij
//
//  Created by Enas Abdallah on 3/25/20.
//  Copyright © 2020 Neoxero. All rights reserved.
//
import Foundation

protocol CodableInit {
    init(data: Data) throws
}

extension CodableInit where Self: Codable {
    init(data: Data) throws {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self = try decoder.decode(Self.self, from: data)
    }
}

