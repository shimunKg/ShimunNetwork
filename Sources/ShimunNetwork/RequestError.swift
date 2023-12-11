//
//  RequestError.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation


public enum RequestError: Error {
    case requestCompositionFailure
    case unexpectedResponse
    case decodeFailure
}
