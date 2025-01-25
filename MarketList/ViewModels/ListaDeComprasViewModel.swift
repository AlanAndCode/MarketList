//
//  ListaDeComprasViewModel.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 24/01/2025.
//

import Foundation
import SwiftUI

class ListaDeComprasViewModel: ObservableObject {
    @Published var itens: [Item] = []
    
    
    func adicionarItem(nome: String, quantidade: Int, estado: Localizacao) {
        let novoItem = Item(nome: nome, quantidade: quantidade, estado: estado)
        itens.append(novoItem)
    }
    
    
    func adicionarQuantidadeParaItem(_ item: Item) {
        if let index = itens.firstIndex(where: { $0.id == item.id }) {
            itens[index].quantidade += 1
        }
    }
    
    
    func removerQuantidadeParaItem(_ item: Item) {
        if let index = itens.firstIndex(where: { $0.id == item.id }) {
            if itens[index].quantidade > 0 {
                itens[index].quantidade -= 1
            }
        }
    }
}

