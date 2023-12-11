//
//  GenericDecoder.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

protocol GenericDecoder {
    func decode<T>(expect type: T.Type, from data: Data) throws -> T where T: Decodable
}

extension JSONDecoder: GenericDecoder {
    
    func decode<T>(expect type: T.Type, from data: Data) throws -> T where T: Decodable {
        return try decode(type, from: data)
    }
}
