//
//  SettingsView.swift
//  MarketList
//
//  Created by Alan Modesto on 01/02/25.
//


import SwiftUI

struct SettingsView: View {
    @Binding var itemThreshold: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Configuração")) {
                    TextField("Numero de itens necessarios para ser transeferido para o estoque", text: $itemThreshold)
                        .keyboardType(.numberPad)
                        .submitLabel(.done)
                        .onSubmit {
                            dismiss()
                        }
                }
            }
            .navigationTitle("A partir de quantos itens voce quer que va para o estoque ")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar") {
                        dismiss()
                    }
                }
            }
        }
    }
}
