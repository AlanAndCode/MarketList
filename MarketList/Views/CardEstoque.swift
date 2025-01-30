//
//  CardEstoque.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//

import SwiftUI

struct CardEstoque: View {
    @ObservedObject var viewModel: CardEstoqueViewModel
    
    var body: some View {
        ZStack {
            Color.brown.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 12) {
                    if viewModel.itensEmEstoque.isEmpty {
                        Text("Nenhum item em estoque")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    } else {
                        ForEach(viewModel.itensEmEstoque) { item in
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(item.nome)
                                        .font(.headline)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("Quantidade: \(item.quantidade)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
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
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            .padding(.horizontal)
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
