//
//  SettingsView.swift
//  MarketList
//
//  Created by Alan Modesto on 01/02/25.
//


struct SettingsView: View {
    @Binding var itemThreshold: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Configuração")) {
                    TextField("A partir de quantos itens?", text: $itemThreshold)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Configurar Limite")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
