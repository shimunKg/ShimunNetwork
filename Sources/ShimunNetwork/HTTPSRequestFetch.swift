//
//  HTTPSRequestFetch.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation


public struct HTTPSRequestFetch<R: Decodable> {
    public let result: R
    public let response: HTTPURLResponse
    
    public init(result: R, response: HTTPURLResponse) {
        self.result = result
        self.response = response
    }
}
