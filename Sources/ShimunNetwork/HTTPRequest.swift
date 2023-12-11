//
//  HTTPRequest.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

public protocol HTTPRequest {
    var scheme: Scheme { get }
    var host: String { get }
    var path: String { get }
    var port: Int? { get }
    var queryParameters: [String: String]? { get }
    var headers: [String: String]? { get }
    var method: HTTPMethod { get }
    var body: HTTPBody? { get set }
    
    func composeRequest() -> URLRequest?
}

extension HTTPRequest {
    func convertToURLQueryParameters(queryParameters: [String: String]) -> [URLQueryItem] {
        return queryParameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
    }
    
    func generateURLFromComponents() -> URL? {
        var components = URLComponents()
        components.scheme = scheme.value
        components.host = host
        components.path = path
        components.port = port
        if let queryParameters = queryParameters {
            components.queryItems = convertToURLQueryParameters(queryParameters: queryParameters)
        }
        return components.url
    }
    
    public func composeRequest() -> URLRequest? {
        guard let url = generateURLFromComponents() else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.value
        headers.map {
            for (headerField, value) in $0 {
                request.addValue(value, forHTTPHeaderField: headerField)
            }
        }
        request.httpBody = body?.data
        
        return request
    }
}
