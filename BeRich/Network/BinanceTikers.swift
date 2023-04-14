//
//  BinanceTikers.swift
//  BeRich
//
//  Created by Matvei Bykadorov on 13.04.2023.
//

import Foundation

struct BinanceTikers: Decodable {
    let timezone: String
    let serverTime: Int
    let symbols: [Symbols]
}

struct Symbol: Decodable {
    let symbol: String
    let status: Status
}

enum Status: String, Decodable {
    case noTrading = "BREAK"
    case trading = "TRADING"
}
