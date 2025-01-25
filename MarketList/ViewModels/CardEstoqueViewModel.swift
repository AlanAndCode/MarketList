//
//  CardEstoqueViewModel.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//


import Foundation
import SwiftUI

class CardEstoqueViewModel: ObservableObject {
    @Published var itens: [Item] = []

    func atualizarItens(_ novosItens: [Item]) {
        itens = novosItens
    }
}
