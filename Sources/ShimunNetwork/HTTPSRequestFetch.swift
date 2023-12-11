//
//  HTTPSRequestFetch.swift
//  NetworkingLayer
//
//  Created by Nikola Jovanovic Simunic on 11.12.23..
//

import Foundation


public struct HTTPSRequestFetch<R: Decodable> {
    let result: R
    let response: HTTPURLResponse
}
