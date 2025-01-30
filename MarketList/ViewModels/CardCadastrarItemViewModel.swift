//
//  CardCadastrarItemViewModel.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//


import Foundation
import SwiftUI

class CardCadastrarItemViewModel: ObservableObject {
    @Published var nomeProduto: String = ""
    @Published var quantidade: String = "" 

    private var estoqueViewModel: CardEstoqueViewModel

    init(estoqueViewModel: CardEstoqueViewModel) {
        self.estoqueViewModel = estoqueViewModel
    }

    func cadastrarItem() {
        let quantidadeInt = Int(quantidade) ?? 0

        if !nomeProduto.isEmpty, quantidadeInt > 0 {
            print("Item cadastrado com sucesso!")
            print("Produto: \(nomeProduto), Quantidade: \(quantidadeInt)")

            let novoItem = Item(
                nome: nomeProduto,
                quantidade: quantidadeInt,
                status: .emEstoque
            )

            estoqueViewModel.adicionarItem(item: novoItem)

            nomeProduto = ""
            quantidade = ""
        } else {
            print("Por favor, preencha todos os campos corretamente.")
        }
    }
}
