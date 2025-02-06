//
//  SettingsView.swift
//  MarketList
//
//  Created by Alan Modesto on 01/02/25.
//


import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings = AppSettings.shared
    @Binding var itemThreshold: String
    @Environment(\.dismiss) var dismiss
    var source: ViewSource 

        var body: some View {
            NavigationStack {
                Form {
                    Section(header: Text("Configuração")) {
                        Stepper("Mover para \(source == .lista ? "Lista" : "Estoque") a partir de \(settings.itemThreshold) itens", value: $settings.itemThreshold, in: 1...100)
                            .padding()
                    }
            }
            .navigationTitle("Configuração do Estoque")
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
