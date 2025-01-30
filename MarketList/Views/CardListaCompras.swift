//
//  CardVamosComprar.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//


import SwiftUI

struct CardListaCompras: View {
    var nome: String
    @ObservedObject var viewModel: ListaDeComprasViewModel

    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 12) {
                    if viewModel.itensEmLista.isEmpty {
                        Text("Nenhum item na lista de compras")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    } else {
                        ForEach(viewModel.itensEmLista) { item in
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(item.nome)
                                        .font(.headline)
                                        .frame(maxWidth: .infinity, alignment: .leading)

                                    Text("Quantidade: \(item.quantidade)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()

                                Button(action: {
                                    viewModel.incrementarQuantidade(item: item)
                                }) {
                                    Image(systemName: "plus.circle")
                                        .font(.title2)
                                        .foregroundColor(.green)
                                }
                                
                                Button(action: {
                                    viewModel.decrementarQuantidade(item: item)
                                }) {
                                    Image(systemName: "minus.circle")
                                        .font(.title2)
                                        .foregroundColor(.red)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    let estoqueViewModel = CardEstoqueViewModel()
    let listaDeComprasViewModel = ListaDeComprasViewModel(estoqueViewModel: estoqueViewModel)
    
    listaDeComprasViewModel.adicionarItemEmLista(nome: "Arroz", quantidade: 0)
    listaDeComprasViewModel.adicionarItemEmLista(nome: "Feijão", quantidade: 0)
    
    return CardListaCompras(nome: "Vamos Comprar", viewModel: listaDeComprasViewModel)
}
