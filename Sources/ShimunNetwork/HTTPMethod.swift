//
//  HTTPMethod.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

public enum HTTPMethod: String {
    case get
    case head
    case post
    case put
    case delete
    case patch
    case connect
    case options
    case trace

    var value: String {
        rawValue.uppercased()
    }
}
