//
//  ContentView.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 17/01/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var listaDeComprasViewModel = ListaDeComprasViewModel()
    @StateObject private var estoqueViewModel = CardEstoqueViewModel()
    @StateObject private var cadastrarViewModel = CardCadastrarItemViewModel()

    var body: some View {

        TabView {
            
            CardCadastrarItem(nomeProduto: "", viewModel: cadastrarViewModel)
                .tabItem {
                    Label("Cadastrar", systemImage: "plus.circle")
                }
            
            CardEstoque(nome: "Produto Estoque", viewModel: CardEstoqueViewModel())
                .tabItem {
                    Label("Estoque", systemImage: "archivebox")
                }
            
            
            CardListaCompras(nome: "Vamos Comprar", viewModel: listaDeComprasViewModel)
                .tabItem {
                    Label("Comprar", systemImage: "cart")
                }

        }
        .accentColor(.red) // Cor dos ícones selecionados
    }
}

#Preview {
    ContentView()
}


