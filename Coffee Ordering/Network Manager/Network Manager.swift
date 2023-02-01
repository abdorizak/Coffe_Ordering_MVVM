//
//  Network Manager.swift
//  Coffee Ordering
//
//  Created by Abdirizak Hassan on 2/1/23.
//

import Foundation

// https://warp-wiry-rugby.glitch.me/orders 
final class NetworkManager {
    static let shared = NetworkManager()
    
    private let decoding = JSONDecoder()
    
    private init() {
        decoding.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    /// MARK:- Functions
    
}
