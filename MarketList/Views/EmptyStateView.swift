//
//  EmptyStateView.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 25/01/2025.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            
            Text("Sua lista está vazia")
                .font(.title2)
                .foregroundColor(.gray)
            
            Text("Adicione itens para começar.")
                .font(.body)
                .foregroundColor(.secondary)
            
            Button(action: {
                // Ação para adicionar o primeiro item
            }) {
                Text("Adicionar Item")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    EmptyStateView()
}

