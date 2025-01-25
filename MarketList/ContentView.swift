//
//  ContentView.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 17/01/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ListaDeComprasViewModel()

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CardVamosComprar(nome: "vamos compaa",viewModel: ListaDeComprasViewModel())) {
                    Text("Vamos Comprar")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: CardEstoque(nome: "Em Estoque",viewModel: CardEstoqueViewModel())) {
                    Text("Nosso Estoque")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

               
                .padding()
            }
            .navigationTitle("Tela Principal")
        }
    }
}

#Preview {
    ContentView()
}
