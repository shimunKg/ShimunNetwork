//
//  RequestError.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation


public enum SHError: Error {
    case requestCompositionFailure
    case unexpectedResponse
    case decodeFailure
    case networkError(URLError) // A case to encapsulate URLError
    case customError(Error)

    var description: String {
        switch self {
        case .requestCompositionFailure:
            return "Failed to compose the request."
        case .unexpectedResponse:
            return "Received an unexpected response."
        case .decodeFailure:
            return "Failed to decode the response."
        case .networkError(let urlError):
            return "Network error: \(urlError.localizedDescription)"
        case .customError(let error):
            return ""
        }
    }
}
