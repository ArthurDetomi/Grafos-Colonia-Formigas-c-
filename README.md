# Documentação

Grupo: Geraldo Arthur Detomi, Diogo 

## Depêndencias
Necessário ter instalado um compilador de linguagem C++ e o make.
- Distribuições Debian🐧
```shell
sudo apt install build-essential cmake
```
## Parte 1 - Compilação:

Para compilar o programa, navegue até o diretório atual onde se encontram os arquivos correspondentes do programa, usando o terminal. Agora, basta executar o seguinte comando:

```bash
make
``````
Isso irá compilar o programa.

## Parte 2 - Execução

Após compilar o programa, você pode executá-lo de duas maneiras diferentes:

### Opção 1:
Rode o seguinte comando, e a saída será impressa diretamente no terminal:

```bash
make rodar_programa
```
### Opção 2:

Você também pode executar o programa e salvar a saída em um arquivo no diretório "/output". Para fazer isso, execute o seguinte comando:

```bash
make rodar_programa_saida_arquivo
```


## Inserir Novos Testes

**O arquivo teste.txt está localizado na pasta "input/"**

Após inserir o grafo que deseja testar no arquivo "teste.txt", lembre-se de que o programa aceita apenas entradas no respectivo formato:

```txt
15
    0  29  82  46  68  52  72  42  51  55  29  74  23  72  46  
   29   0  55  46  42  43  43  23  23  31  41  51  11  52  21  
   82  55   0  68  46  55  23  43  41  29  79  21  64  31  51  
   46  46  68   0  82  15  72  31  62  42  21  51  51  43  64  
   68  42  46  82   0  74  23  52  21  46  82  58  46  65  23  
   52  43  55  15  74   0  61  23  55  31  33  37  51  29  59  
   72  43  23  72  23  61   0  42  23  31  77  37  51  46  33  
   42  23  43  31  52  23  42  0  33   15  37  33  33  31  37  
   51  23  41  62  21  55  23  33   0  29  62  46  29  51  11  
   55  31  29  42  46  31  31  15  29   0  51  21  41  23  37  
   29  41  79  21  82  33  77  37  62  51   0  65  42  59  61  
   74  51  21  51  58  37  37  33  46  21  65   0  61  11  55  
   23  11  64  51  46  51  51  33  29  41  42  61   0  62  23  
   72  52  31  43  65  29  46  31  51  23  59  11  62   0  59  
   46  21  51  64  23  59  33  37  11  37  61  55  23  59   0
```
Ou seja o número 15 representa o número total de cidades do grafo, logo em seguida a matriz que representa o grafo.

## Alguns testes e suas saídas esperadas
### Teste 1:
**Input :**
```txt
15
    0  29  82  46  68  52  72  42  51  55  29  74  23  72  46  
   29   0  55  46  42  43  43  23  23  31  41  51  11  52  21  
   82  55   0  68  46  55  23  43  41  29  79  21  64  31  51  
   46  46  68   0  82  15  72  31  62  42  21  51  51  43  64  
   68  42  46  82   0  74  23  52  21  46  82  58  46  65  23  
   52  43  55  15  74   0  61  23  55  31  33  37  51  29  59  
   72  43  23  72  23  61   0  42  23  31  77  37  51  46  33  
   42  23  43  31  52  23  42  0  33   15  37  33  33  31  37  
   51  23  41  62  21  55  23  33   0  29  62  46  29  51  11  
   55  31  29  42  46  31  31  15  29   0  51  21  41  23  37  
   29  41  79  21  82  33  77  37  62  51   0  65  42  59  61  
   74  51  21  51  58  37  37  33  46  21  65   0  61  11  55  
   23  11  64  51  46  51  51  33  29  41  42  61   0  62  23  
   72  52  31  43  65  29  46  31  51  23  59  11  62   0  59  
   46  21  51  64  23  59  33  37  11  37  61  55  23  59   0
```
**Output:**
```txt
Tentativa #1
Melhor comprimento do tour: 284
Melhor ordem do tour: 6 2 13 11 9 7 5 3 10 0 12 1 14 8 4 
Tentativa #2
Melhor comprimento do tour: 284
Melhor ordem do tour: 6 2 13 11 9 7 5 3 10 0 12 1 14 8 4 
Tentativa #3
Melhor comprimento do tour: 284
Melhor ordem do tour: 6 2 13 11 9 7 5 3 10 0 12 1 14 8 4 
```

## Problema

O problema que estamos tentando resolver envolve a busca de caminhos em grafos. Este é um problema computacional comum que pode ser encontrado em várias situações do mundo real, como roteamento de redes de computadores e planejamento de transporte urbano.

Para resolver este problema, utilizamos o algoritmo de otimização da colônia de formigas (ACO). O ACO é uma heurística baseada em probabilidade que foi inspirada no comportamento das formigas ao saírem de sua colônia para encontrar comida. As formigas andam sem rumo até que, encontrada comida, elas retornam à colônia deixando um rastro de feromônio. Se outras formigas encontram um desses rastros, elas tendem a não seguir mais caminhos aleatórios. Em vez disso, seguem a trilha encontrada, retornando e inclusive enfatizando se acharam alimento.

No algoritmo ACO, "formigas virtuais" caminham por um grafo que representa o problema a ser resolvido. O ACO tem sido utilizado para produzir soluções quase ótimas para o problema do caixeiro viajante. Este algoritmo apresenta uma vantagem sobre outros algoritmos heurísticos, como o algoritmo de arrefecimento simulado e o algoritmo genético, especialmente se o grafo muda dinamicamente. A colônia de formigas pode mudar várias vezes e se adaptar às mudanças em tempo real.

## Solução:

O código fornecido implementa um algoritmo de otimização baseado em Colônia de Formigas para resolver o problema do Caixeiro Viajante (TSP). Aqui está uma visão geral do funcionamento do algoritmo:

1. **Estruturas de Dados:**
   - `Formiga`: Representa uma formiga que percorre o caminho. Mantém informações como o tamanho do caminho, as cidades visitadas e o caminho percorrido.
   - `OtimizacaoColoniaFormigas`: Classe principal que contém parâmetros e métodos para otimização.

2. **Inicialização:**
   - O programa lê o número de cidades e cria uma instância da classe `OtimizacaoColoniaFormigas` com base nesse número.
   - A matriz de distâncias entre as cidades (`grafo`) é lida a partir da entrada padrão.

3. **Otimização:**
   - O algoritmo executa três tentativas de otimização.
   - Cada tentativa envolve:
     - Preparação das formigas.
     - Limpeza das trilhas de feromônios.
     - Iterações para mover as formigas, calcular probabilidades e atualizar as trilhas.

4. **Seleção de Próxima Cidade:**
   - A escolha da próxima cidade é feita com base nas probabilidades calculadas a partir dos feromônios e das distâncias entre as cidades.

5. **Atualização de Feromônios:**
   - As trilhas de feromônios são atualizadas de acordo com a contribuição de cada formiga.

6. **Melhor Solução:**
   - A melhor solução (melhor ordem do tour e seu comprimento) é atualizada ao longo das iterações.

7. **Saída:**
   - Ao final de cada tentativa, a melhor ordem do tour e seu comprimento são exibidos.

