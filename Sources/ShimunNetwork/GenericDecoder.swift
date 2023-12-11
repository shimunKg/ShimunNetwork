//
//  GenericDecoder.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

public protocol GenericDecoder {
    func decode<T>(expect type: T.Type, from data: Data) throws -> T where T: Decodable
}

extension JSONDecoder: GenericDecoder {
    
    public func decode<T>(expect type: T.Type, from data: Data) throws -> T where T: Decodable {
        return try decode(type, from: data)
    }
}
