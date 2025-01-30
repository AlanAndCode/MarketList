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
    @Published var itens: [Item] = []

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
    
    func decrementarQuantidade(item: Item) {
        if let index = itens.firstIndex(where: { $0.id == item.id }) {
            if itens[index].quantidade > 0 {
                itens[index].quantidade -= 1
                atualizarListas()
                
            }
        }
    }
    
    private func atualizarListas() {
        itensEmEstoque = itens.filter { $0.quantidade > 0 }
        itensEmLista = itens.filter { $0.quantidade == 0 }

        print("📌 Itens em estoque:", itensEmEstoque.map { "\($0.nome) (\($0.quantidade))" })
        print("⚠️ Itens em falta:", itensEmLista.map { "\($0.nome)" })
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
