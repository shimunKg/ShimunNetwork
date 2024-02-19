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
    
    public init(
        session: URLSession = URLSession.shared,
        decoder: GenericDecoder? = JSONDecoder()
    ) {
        self.session = session
        self.decoder = decoder
    }
    
    public func send(_ request: HTTPRequest) async throws -> (data: Data, response: URLResponse)/*HTTPSRequestFetch<R> where T: HTTPRequest, R: Decodable*/ {
        
        guard let urlRequest = request.composeRequest() else {
            throw SHError.requestCompositionFailure
        }
        do {
            let (data, response) = try await session.data(for: urlRequest)
            return (data: data ,response: response)
//            
//            guard let response = response as? HTTPURLResponse else {
//                throw SHError.unexpectedResponse
//            }
//            
//            guard let decoder = decoder else {
//                throw SHError.decodeFailure
//            }
//            
//            let result = try decoder.decode(expect: R.self, from: data)
//            return .init(result: result, response: response)
            
        } catch let error as URLError {
            throw SHError.networkError(error)
        }
    }
    
}

