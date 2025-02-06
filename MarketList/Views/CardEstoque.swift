//
//  CardEstoque.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//

import SwiftUI

struct CardEstoque: View {
    @ObservedObject var viewModel: CardEstoqueViewModel
    @State private var showingConfig = false
    @State private var itemThreshold: String = ""
    
    var body: some View {
        ZStack {
            Color.brown.ignoresSafeArea()
            
            ScrollView {
                
                VStack(spacing: 8) {
                    HStack {
                        Text("Estoque")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Button(action: {
                            showingConfig.toggle()
                        }) {
                            Image(systemName: "gearshape")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $showingConfig) {
                            SettingsView(itemThreshold: $itemThreshold, source: .estoque)
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .background(Color.black)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        if viewModel.itensEmEstoque.isEmpty {
                            Text("Nenhum item em Estoque")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                        } else {
                            ForEach(viewModel.itensEmEstoque) { item in
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
                                .background(Color.yellow)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            print("📌 CardEstoque apareceu na tela")
            print("🔍 Itens em estoque:", viewModel.itensEmEstoque)
        }
    }
}

#Preview {
    CardEstoque(viewModel: CardEstoqueViewModel())
}
