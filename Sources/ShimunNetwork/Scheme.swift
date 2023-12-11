//
//  Scheme.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

public enum Scheme: String {
    case http
    case https
    
    var value: String {
        rawValue.uppercased()
    }
}
