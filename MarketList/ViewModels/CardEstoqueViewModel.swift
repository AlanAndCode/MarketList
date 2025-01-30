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

    private weak var listaDeComprasViewModel: ListaDeComprasViewModel?

    func setListaDeComprasViewModel(_ viewModel: ListaDeComprasViewModel) {
        self.listaDeComprasViewModel = viewModel
    }

    func adicionarItem(item: Item) {
        print("🟢 Adicionando item: \(item.nome) - Quantidade: \(item.quantidade)")
        itens.append(item)
        atualizarListas()
    }

    func incrementarQuantidade(item: Item) {
        if let index = itens.firstIndex(where: { $0.id == item.id }) {
            itens[index].quantidade += 1
            atualizarListas()
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
        print("🔄 Atualizando listas de estoque...")
        itensEmEstoque = itens.filter { $0.quantidade > 0 }
        itensEmFalta = itens.filter { $0.quantidade == 0 }

        print("📌 Itens em estoque:", itensEmEstoque.map { "\($0.nome) (\($0.quantidade))" })
        print("⚠️ Itens em falta:", itensEmFalta.map { "\($0.nome)" })
    }
}
