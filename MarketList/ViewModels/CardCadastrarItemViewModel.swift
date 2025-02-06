import Foundation
import SwiftUI

class CardCadastrarItemViewModel: ObservableObject {
    @Published var nomeProduto: String = ""
    @Published var quantidade: String = ""

    private var estoqueViewModel: CardEstoqueViewModel

    init(estoqueViewModel: CardEstoqueViewModel) {
        self.estoqueViewModel = estoqueViewModel
    }

    func cadastrarItem() -> String {
        let quantidadeInt = Int(quantidade) ?? 0
        let threshold = AppSettings.shared.itemThreshold

        if !nomeProduto.isEmpty, quantidadeInt > 0 {
            let status: Status = quantidadeInt >= threshold ? .emEstoque : .emLista
            let novoItem = Item(nome: nomeProduto, quantidade: quantidadeInt, status: status)
            estoqueViewModel.adicionarItem(item: novoItem)

            nomeProduto = ""
            quantidade = ""
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

            return "Item cadastrado com sucesso!"
        } else {
            return "Por favor, preencha todos os campos corretamente."
        }
    }
}
