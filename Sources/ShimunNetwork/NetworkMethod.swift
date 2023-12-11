//
//  NetworkMethod.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

//extension JSONEncoder: GenericEncoder { }

public struct HTTPBody {
    
    private(set) var data: Data?
    
    public init(data: Data?) {
        self.data = data
    }
    
    public init<T: Encodable>(_ object: T, encoder: JSONEncoder = JSONEncoder()) {
        data = try? encoder.encode(object)
    }
}



