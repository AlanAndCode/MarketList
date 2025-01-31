//
//  ContentView.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 17/01/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var estoqueViewModel = CardEstoqueViewModel()
    @StateObject private var listaDeComprasViewModel: ListaDeComprasViewModel
    @StateObject private var cadastrarViewModel: CardCadastrarItemViewModel

    init() {
        let estoqueViewModel = CardEstoqueViewModel()
        let listaViewModel = ListaDeComprasViewModel(estoqueViewModel: estoqueViewModel)
        
        _estoqueViewModel = StateObject(wrappedValue: estoqueViewModel)
        _listaDeComprasViewModel = StateObject(wrappedValue: listaViewModel)
        _cadastrarViewModel = StateObject(wrappedValue: CardCadastrarItemViewModel(estoqueViewModel: estoqueViewModel))

        estoqueViewModel.setListaDeComprasViewModel(listaViewModel)     }

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
