//
//  HTTPRequester.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

public protocol HTTPRequester {
    func send<T: HTTPRequest, R: Decodable>(_ request: T, expect: R.Type) async throws -> HTTPSRequestFetch<R>
}
