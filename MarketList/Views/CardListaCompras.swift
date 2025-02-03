//
//  CardVamosComprar.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//


import SwiftUI

struct CardListaCompras: View {
    @ObservedObject var viewModel: ListaDeComprasViewModel
    @State private var showingConfig = false
    @State private var itemThreshold: String = ""
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 8) {
                    HStack {
                        Text("Vamos Comprar")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        
                        Button(action: {
                            showingConfig.toggle()
                        }) {
                            Image(systemName: "gearshape")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .sheet(isPresented: $showingConfig) {
                            SettingsView(itemThreshold: $itemThreshold)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .background(Color.black)
                        .padding(.horizontal)
                    
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
                                        .foregroundColor(.black)
                                    Text("Quantidade: \(item.quantidade)")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    viewModel.incrementarQuantidade(item: item)
                                }) {
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.green)
                                        .frame(width: 30, height: 30)
                                }
                                
                                Button(action: {
                                    viewModel.decrementarQuantidade(item: item)
                                }) {
                                    Image(systemName: "minus.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
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
    
    return CardListaCompras( viewModel: listaDeComprasViewModel)
}
