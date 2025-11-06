# Time de Futebol (Console - Dart)

Este projeto simula a lógica de gerenciamento de dados de um time com vários jogadores de futebol, executando no console (sem UI do Flutter nesta etapa).

## Estrutura de Dados
- **Classe**: `Jogador`
  - **Atributos**: `id` (int), `nome` (String), `posicao` (String), `golsMarcados` (int), `valorDeMercado` (double)
- **Lista**: uma lista com pelo menos 5 instâncias de `Jogador`, com dados de exemplo.

## Lógica Implementada
- **Laço de repetição**: itera sobre a lista de jogadores para exibir seus dados.
- **Condicionais (if/else)**:
  - Marca como **DESTAQUE** jogadores com `golsMarcados >= 10`.
  - Exibe **INVESTIMENTO ALTO** para jogadores com `valorDeMercado > 50` (milhões, valor fictício).
  - Exibe **ALERTA** para jogadores de linha com `golsMarcados == 0`.
- **Estatística adicional**: cálculo de gols totais do elenco e média de gols por jogador.

## Como Executar (Console)
Você pode executar este script de duas formas:

### 1) Usando Dart SDK (recomendado para console)
1. Instale o Dart SDK (se ainda não tiver) e garanta que o comando `dart` esteja no PATH.
2. No terminal, navegue até a pasta do projeto:
   ```bash
   cd time_futebol_console
   ```
3. Execute o script:
   ```bash
   dart run lib/main.dart
   ```

### 2) Usando Android Studio / VS Code
- Abra a pasta `time_futebol_console` no editor.
- Abra um terminal integrado e rode o mesmo comando:
  ```bash
  dart run lib/main.dart
  ```

> Observação: O objetivo aqui é a **lógica de console**. Caso deseje transformar em um app Flutter com interface, basta criar um projeto Flutter e reutilizar a lógica da classe `Jogador` e da lista de dados dentro do `lib/main.dart` do Flutter, adaptando para widgets.

## Saída Esperada (exemplo)
Você verá a listagem do elenco com marcações como **DESTAQUE**, **INVESTIMENTO ALTO** ou **ALERTA**, seguida de um pequeno resumo com total e média de gols.


## Como Testei
- Execução local com `dart run lib/main.dart` no terminal.
- Verificação visual das mensagens condicionais e dos cálculos de total e média de gols.

## Cobertura dos Requisitos Mínimos
- Linguagem Dart: classe com atributos e construtor (`Jogador`).
- Listas: `List<Jogador>` com 5 instâncias de exemplo.
- Laços: `for-in` para iterar sobre a lista.
- Controle de fluxo: `if/else` para aplicar a lógica de destaque/alerta/investimento.
- Boas práticas: código organizado, comentários curtos explicando a intenção e o fluxo.

---

# Parte 2 — Aplicativo Flutter (UI)

Agora a lógica foi integrada a um aplicativo Flutter que exibe os dados na tela com `StatelessWidget`, `Scaffold`, `AppBar` e `ListView`.

## Como Executar (Flutter)
1. Instale o Flutter SDK e configure um AVD (Android Virtual Device) ou conecte um dispositivo.
2. No terminal, dentro da pasta do projeto:
   ```bash
   flutter pub get
   flutter run
   ```
   - Certifique-se de que há um dispositivo disponível: `flutter devices`.

## Estrutura da UI
- `lib/main.dart` contém:
  - `Jogador` (mesma classe da Parte 1)
  - Lista `elenco` (mesmos dados da Parte 1)
  - `MyApp` (StatelessWidget com `MaterialApp`)
  - `PlayersPage` (StatelessWidget com `Scaffold`, `AppBar` e `ListView.builder`)

## Integração dos Dados
- Os mesmos dados da Parte 1 foram mantidos em memória e usados diretamente para renderizar a lista com `ListTile`.
- Regras da Parte 1 foram adaptadas para exibir um “badge” no `trailing` do item: **DESTAQUE**, **INVESTIMENTO** ou **ALERTA**.

## Captura de Tela
Adicione aqui a captura de tela do app executando no emulador (AVD):

![screenshot](docs/screenshot.png)

> Dica: crie a pasta `docs/` na raiz do projeto e salve a imagem como `screenshot.png`, ou ajuste o caminho acima.

---

# Parte 3 — Interatividade com StatefulWidget

A interface agora é interativa. Converti a página principal para `StatefulWidget`, adicionei um `FloatingActionButton` e implementei `setState()` para modificar a lista de jogadores em tempo real.

## O que mudou
- `PlayersPage` agora é `StatefulWidget` com uma lista local `_jogadores`.
- `FloatingActionButton` adiciona um novo jogador à lista ao ser pressionado.
- A UI é atualizada reativamente via `setState()`.
- Cada item foi refinado dentro de um `Card` envolvendo o `ListTile`.

## Como Executar
- Mesmo passo da Parte 2:
  ```bash
  flutter pub get
  flutter run
  ```
- Pressione o botão “Adicionar” para incluir um novo jogador gerado na lista.

## Captura de Tela (Parte 3)
Adicione aqui uma nova captura de tela mostrando o botão e a lista após a interação:

![screenshot_parte3](docs/screenshot_parte3.png)

## Descrição do Gerenciamento de Estado
- O estado vive em `_PlayersPageState` por meio da lista `_jogadores`.
- A ação do botão chama `_adicionarJogador()`, que usa `setState()` para:
  - Calcular o próximo `id` disponível.
  - Inserir um novo `Jogador` no final da lista.
  - Notificar a UI para redesenhar a lista com o novo item.

