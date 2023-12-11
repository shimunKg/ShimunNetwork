//
//  GenericEncoder.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation

protocol GenericEncoder {
    func encode<T: Encodable>(_ object: T.Type) throws -> Data
}


