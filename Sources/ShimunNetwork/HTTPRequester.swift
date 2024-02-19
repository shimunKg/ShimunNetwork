//
//  HTTPRequester.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

public protocol HTTPRequester {
    func send(_ request: HTTPRequest) async throws -> (data: Data, response: URLResponse) //HTTPSRequestFetch<R>
}
