//
//  ListaDeComprasViewModel.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 24/01/2025.
//
import Foundation
import SwiftUI

class ListaDeComprasViewModel: ObservableObject {
    @Published var itensEmEstoque: [Item] = []
    @Published var itensEmLista: [Item] = []
    
    private var estoqueViewModel: CardEstoqueViewModel

    init(estoqueViewModel: CardEstoqueViewModel) {
        self.estoqueViewModel = estoqueViewModel
    }

    func incrementarQuantidade(item: Item) {
        if let index = itensEmLista.firstIndex(where: { $0.id == item.id }) {
            itensEmLista[index].quantidade += 1
            
            moverItemParaEstoque(item: itensEmLista[index])
            itensEmLista.remove(at: index)
        }
    }
    
    private func moverItemParaEstoque(item: Item) {
        estoqueViewModel.adicionarItem(item: item)
        print("📦 Item movido para o estoque: \(item.nome)")
    }
    
    func adicionarItemEmLista(nome: String, quantidade: Int) {
        let novoItem = Item(nome: nome, quantidade: quantidade, status: .emLista)
        itensEmLista.append(novoItem)
    }
}
