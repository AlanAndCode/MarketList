//
//  CardEstoque.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//


import SwiftUI

struct CardEstoque: View {
    var nome: String
    @State private var quantidade = 0
    @ObservedObject var viewModel: CardEstoqueViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(nome)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Quantidade: \(quantidade)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Button(action: {
                quantidade += 1 
            }) {
                Image(systemName: "plus.circle")
                    .font(.title2)
                    .foregroundColor(.green)
            }
            
            Button(action: {
                if quantidade > 0 {
                    quantidade -= 1
                }
            }) {
                Image(systemName: "minus.circle")
                    .font(.title2)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color.yellow)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
        
}

#Preview {
    CardEstoque(nome: "Arroz", viewModel: CardEstoqueViewModel())
}
