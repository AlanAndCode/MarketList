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
    @Published var itensEmFalta: [Item] = []
    @Published var itensEmEstoque: [Item] = []
    @Published var itensEmLista: [Item] = []
    func cadastrarItem() {
 
        guard !nomeProduto.isEmpty, !quantidade.isEmpty else {
            print("Por favor, preencha todos os campos.")
            return
        }

       
        print("Item cadastrado com sucesso!")
        print("Produto: \(nomeProduto), Quantidade: \(quantidade)")

        
        nomeProduto = ""
        quantidade = ""
    }
}
