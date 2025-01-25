//
//  Item.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 24/01/2025.
//

import Foundation

struct Item: Identifiable {
    var id = UUID() 
    var nome: String
    var quantidade: Int
    var status: Status
}
