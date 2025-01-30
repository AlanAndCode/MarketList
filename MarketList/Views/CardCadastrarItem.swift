//
//  CardCadastrarItem.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//


import SwiftUI

struct CardCadastrarItem: View {
    @ObservedObject var viewModel: CardCadastrarItemViewModel
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                Text("Cadastrar Item")
                    .font(.headline)
                    .padding(.bottom, 8)
                
                TextField("Nome do Produto", text: $viewModel.nomeProduto)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Quantidade", text: $viewModel.quantidade)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .keyboardType(.numberPad)

                Button(action: {
                    viewModel.cadastrarItem()
                }) {
                    HStack {
                        Spacer()
                        Text("Cadastrar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
            .padding(.horizontal)
        }
    }
}

