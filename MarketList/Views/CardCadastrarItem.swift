//
//  CardCadastrarItem.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//


import SwiftUI

struct CardCadastrarItem: View {
    @StateObject var viewModel: CardCadastrarItemViewModel
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                    
                    Spacer()
                }
                .padding(.bottom, 40)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Cadastrar Item")
                        .font(.headline)
                        .padding(.bottom, 8)
                       .foregroundColor(.black)
                    TextField("Nome do Produto", text: $viewModel.nomeProduto)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundColor(.white)

                    TextField("Quantidade", text: $viewModel.quantidade)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .keyboardType(.numberPad)
                        .background(Color.white)
                        .foregroundColor(.white)
                     
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
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                .padding(.horizontal)
            }
        }
    }
}
