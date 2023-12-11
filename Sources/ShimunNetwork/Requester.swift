//
//  Requester.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation


final public class Requester: HTTPRequester {
    
    let session: URLSession
    var decoder: GenericDecoder?
    
    init(
        session: URLSession = URLSession.shared,
        decoder: GenericDecoder? = JSONDecoder()
    ) {
        self.session = session
        self.decoder = decoder
    }
    
    public func send<T, R>(_ request: T, expect: R.Type) async throws -> HTTPSRequestFetch<R> where T: HTTPRequest, R: Decodable {
        
        guard let urlRequest = request.composeRequest() else {
            throw RequestError.requestCompositionFailure
        }
        
        let (data, response) = try await session.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.unexpectedResponse
        }
        
        guard let decoder = decoder else {
            throw RequestError.decodeFailure
        }
        
        let result = try decoder.decode(expect: R.self, from: data)
        return .init(result: result, response: response)
    }
    
}

