//
//  Item.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 24/01/2025.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()  // Identificador único
    var nome: String
    var quantidade: Int
    var estado: Localizacao
}

enum Localizacao {
    case emFalta
    case emLista
    case emEstoque
}
