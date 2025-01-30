//
//  ContentView.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 17/01/2025.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var listaDeComprasViewModel = ListaDeComprasViewModel()
    @StateObject private var estoqueViewModel = CardEstoqueViewModel()
    
    @StateObject private var cadastrarViewModel: CardCadastrarItemViewModel

    init() {
        let estoqueViewModel = CardEstoqueViewModel()
        _estoqueViewModel = StateObject(wrappedValue: estoqueViewModel)
        _cadastrarViewModel = StateObject(wrappedValue: CardCadastrarItemViewModel(estoqueViewModel: estoqueViewModel))
    }

    var body: some View {
        TabView {
            CardCadastrarItem(viewModel: cadastrarViewModel)
                .tabItem {
                    Label("Cadastrar", systemImage: "plus.circle")
                }

            CardEstoque(viewModel: estoqueViewModel)
                .tabItem {
                    Label("Estoque", systemImage: "archivebox")
                }

            CardListaCompras(nome: "Vamos Comprar", viewModel: listaDeComprasViewModel)
                .tabItem {
                    Label("Comprar", systemImage: "cart")
                }
        }
        .accentColor(.red)
    }
}
