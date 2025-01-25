//
//  CardVamosComprar.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//


import SwiftUI

struct CardVamosComprar: View {
    var nome: String
    @State private var quantidade = 0

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(nome)
                    .font(.headline)
                
                Text("Quantidade: \(quantidade)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Botão de Adicionar
            Button(action: {
                quantidade += 1 // Incrementa a quantidade
            }) {
                Image(systemName: "plus.circle")
                    .font(.title2)
                    .foregroundColor(.green)
            }
            
            // Botão de Remover
            Button(action: {
                if quantidade > 0 { // Evita valores negativos
                    quantidade -= 1
                }
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

#Preview {
    CardVamosComprar(nome: "Arroz")
}
