//
//  Request.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

public struct Request: HTTPRequest {
    public var scheme: Scheme
    public var host: String
    public var path: String
    public var port: Int?
    public var queryParameters: [String : String]?
    public var headers: [String : String]?
    public var method: HTTPMethod
    public var body: HTTPBody?
    
    public init(
        scheme: Scheme,
        host: String,
        path: String,
        port: Int? = nil,
        queryParameters: [String : String]? = nil,
        headers: [String : String]? = nil,
        method: HTTPMethod,
        body: HTTPBody? = nil
    ) {
        self.scheme = scheme
        self.host = host
        self.path = path
        self.port = port
        self.queryParameters = queryParameters
        self.headers = headers
        self.method = method
        self.body = body
    }
}
