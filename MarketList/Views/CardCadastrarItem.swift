//
//  CardCadastrarItem.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//


import SwiftUI

struct CardCadastrarItem: View {
    @State private var nomeProduto: String = ""
    @State private var quantidade: String = ""

    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea() // Fundo amarelo ocupa toda a tela

            VStack {
                // Exibe o ícone do carrinho em cima do fundo amarelo usando HStack
                HStack {
                    Image(systemName: "cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black)
                        .padding(.leading, 20) // Adiciona um espaço à esquerda para alinhamento

                    Spacer() // Preenche o restante do espaço na horizontal
                }
                .padding(.bottom, 40) // Espaçamento entre o ícone e os campos

                VStack(alignment: .leading, spacing: 16) {
                    Text("Cadastrar Item")
                        .font(.headline)
                        .padding(.bottom, 8)

                    // Campo para Nome do Produto
                    TextField("Nome do Produto", text: $nomeProduto)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    // Campo para Quantidade
                    TextField("Quantidade", text: $quantidade)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .keyboardType(.numberPad)

                    // Botão de Cadastrar
                    Button(action: {
                        cadastrarItem()
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

    // Função para cadastrar item (placeholder)
    private func cadastrarItem() {
        print("Produto: \(nomeProduto), Quantidade: \(quantidade)")
    }
}

#Preview {
    CardCadastrarItem()
}
