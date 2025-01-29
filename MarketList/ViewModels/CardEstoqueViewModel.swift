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
    @Published var itensEmFalta: [Item] = []
    @Published var itensEmEstoque: [Item] = []
    @Published var itensEmLista: [Item] = []

    // Método para incrementar a quantidade de um item
    func incrementarQuantidade(item: Item) {
        if let index = itens.firstIndex(where: { $0.id == item.id }) {
            itens[index].quantidade += 1
            atualizarListas()
        }
    }

    // Método para decrementar a quantidade de um item
    func decrementarQuantidade(item: Item) {
        if let index = itens.firstIndex(where: { $0.id == item.id }) {
            if itens[index].quantidade > 0 {
                itens[index].quantidade -= 1
                atualizarListas()
            }
        }
    }

    // Método para atualizar as listas de itens
    private func atualizarListas() {
        itensEmEstoque = itens.filter { $0.quantidade > 0 }
        itensEmFalta = itens.filter { $0.quantidade == 0 }
        // Adicione lógica para itensEmLista, se necessário
    }
}
