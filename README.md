# MarketList  

**MarketList** é um aplicativo de lista de compras desenvolvido em **SwiftUI** para ajudar os usuários a gerenciar seus itens de compra e estoque doméstico de forma eficiente. O projeto utiliza conceitos modernos de desenvolvimento iOS, incluindo arquitetura baseada em `ViewModel` com `ObservableObject`, além de recursos como notificações personalizadas e estados vazios para melhorar a experiência do usuário.  

## 📋 Principais Funcionalidades  
- **Lista de Compras**: Gerencie facilmente itens que precisam ser comprados, com filtros para exibir apenas itens em falta ou próximos de acabar.  
- **Estoque**: Visualize o que já está disponível em casa e mantenha o controle dos produtos.   
- **Configurações Personalizadas**: Defina a quantidade mínima de itens para mover produtos automaticamente do estoque para a lista de compras.  
- **Cadastro Simples de Produtos**: Utilize um card de cadastro rápido para adicionar novos produtos.  
- **Interface Moderna e Responsiva**: Layout criado com `ZStack`, `VStack` e `HStack`, utilizando cores de fundo, sombras e botões arredondados para um visual profissional.  

## 🛠️ Estrutura do Projeto  
- **Modelos (`Item`)**: Representa itens do estoque ou lista de compras, com propriedades como nome, quantidade e status.  
- **ViewModels (`ListaDeComprasViewModel`, `CardEstoqueViewModel`)**: Responsáveis pela lógica de negócio e atualização das views.  
- **Views (`CardListaCompras`, `CardEstoque`, `SettingsView`)**: Componentes de interface que exibem os dados e permitem a interação do usuário.  

## 🚀 Tecnologias Utilizadas  
- **SwiftUI**  
- **Combine** (`@Published`, `ObservableObject`)  
- **Arquitetura MVVM**  
- **Notificações locais**  
- **Configurações personalizadas via `@Binding` e `@State`**  

## ▶️ Como Executar o Projeto  
1. Clone o repositório:  
   ```bash  
   git clone https://github.com/seu-usuario/MarketList.git  
   ```  
2. Abra o projeto no Xcode.  
3. Selecione um simulador ou dispositivo físico.  
4. Execute o projeto (`Cmd + R`).  

## 🔮 Futuras Implementações  
- Notificações mensais em vez de diárias.  
- Histórico de compras.  
- Suporte ao Firebase para persistência de dados.  
- **Notificações**: Receba lembretes configuráveis, como *"Hora do mercado! Você tem itens em falta..."*. 
