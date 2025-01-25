//
//  ListaDeComprasViewModel.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 24/01/2025.
//

import Foundation
import SwiftUI

class ListaDeComprasViewModel: ObservableObject {
    @Published var itensEmFalta: [Item] = []
    @Published var itensEmEstoque: [Item] = []
    @Published var itensEmLista: [Item] = []

    // Função para adicionar um item à lista em falta
    func adicionarItemEmFalta(nome: String, quantidade: Int) {
        let novoItem = Item(nome: nome, quantidade: quantidade, status: .emFalta)
        itensEmFalta.append(novoItem)
    }

    // Função para adicionar um item à lista em estoque
    func adicionarItemEmEstoque(nome: String, quantidade: Int) {
        let novoItem = Item(nome: nome, quantidade: quantidade, status: .emEstoque)
        itensEmEstoque.append(novoItem)
    }

    // Função para adicionar um item à lista de compras
    func adicionarItemEmLista(nome: String, quantidade: Int) {
        let novoItem = Item(nome: nome, quantidade: quantidade, status: .emLista)
        itensEmLista.append(novoItem)
    }
}


