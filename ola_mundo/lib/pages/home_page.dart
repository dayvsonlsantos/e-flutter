// Componetizando os itens
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_mundo/pages/second_page.dart';
// import 'package:ola_mundo/controller/home_controller.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context) {

//     // O context representa a aplicação inteira, como um todo.
//       // Ele nunca deve ser armazenado, e devemos sempre buscar usar ele dentro do método build

//     // Para recuperar os valores, utilizamos esse context

//     // Passo a !, pois o valor pode ser nulo
//     var controller = HomeController.of(context);
//     // Como o ValueNotifier é uma reatividade, e temos esse dependOnInheritedWidgetOfExactType
//     // Isso significa que sempre que alterarmos o valor, nesse caso incrementar,
//     // Por termos usado o dependOnInheritedWidgetOfExactType, ele irá automaticamente
//     // atualizar o homePage

//     // Existem dois Widgets que fazem herança das coisas do MaterialApp em uma página:
//     // São eles: Material e Scaffold
//     // O que ganho ao utilizar o Scaffold ? Ganhamos uma serie de propriedades que
//     // vão fazer você criar a sua tela. Exemplo: appBar: AppBar() -> Recebe um Widget AppBar
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       // Center é um Widget para centralizar
//       // Text é um Widget para texto
//       body: Center(
//         child: Text('Flutterando ${controller.value}')
//       ),
//       floatingActionButton: FloatingActionButton(
//         // Exige algumas propriedades

//         // Adiciona um icone
//         child: const Icon(Icons.add),
//         // Ao clicar, chamará essa função anonima (pois não está com nome)
//         onPressed: () {
//           // print('clicou');
//           controller.increment();
//         },
//       ),
//     );
//   }
// }

// O StatelessWidget foi criado para não ser auto gerenciado,
// mas existe um outro Widget que foi criado para separar um estado
// e você gerenciar o estado separadamente. Widget esse conhecido como StatefulWidget

// Esse Widget foi criado, pensando em que você possa gerenciar o estado, separadamente
// Pois, os Widget são categoricamente imutáveis, mas com o State, podemos alterar

// São duas funções, pois o flutter respeita os padrões do SOLID. Nesse caso, responsabilidade única

// Widget, tem a responsabilidade de desenhar na tela
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // Esse, não pede um build como o StatelessWidget
  // Mas sim, um State, que basicamente recebe um Widget
  @override
  State<HomePage> createState() => _HomePageState();
}

// State, tem a responsabilidade de gerenciar esse estado
class _HomePageState extends State<HomePage> {
  // Com o StatefulWidget ganhamos a gerencia do seu próprio estado, sem depender do InheritedWidget;
  // Além disso, podemos escutar o ciclo de vida da tela, da criação desse Widget
  // Exemplo:

  // Chamado quando o Widget for construído
  @override
  void initState() {
    super.initState();
  }

  // Chamado quando o Widget for destruído
  @override
  void dispose() {
    super.dispose();
  }

  // Com ambos acima, temos um controle do ciclo de vida, executando funções no começo e quando o Widget for destruído.

  // Além disso, temos o controle de estado, isso significa, que posso alterar o contador da seguinte forma;
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    
    final listaFavorita = ['loja 01', 'loja 02', 'loja 03', 'loja 04'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      // Columns e Rows

      body: SizedBox(
        // Define o tamanho da tela
        width: double.infinity,
        height: double.infinity,
        // Para permitir ter um tamanho a mais na tela, adicionando um Scroll, utilizo o SingleChildScrollView
        // child: SingleChildScrollView(
        // child: Column(

        // Posso ainda, substituir esses dois itens acima, por apenas um: ListView
        child: ListView.builder(
          // Utilizando o ListView, podemos utilizar o builder

            // Define o alinhamento inicial da coluna/linha
            // mainAxisAlignment: MainAxisAlignment.start,

            // Define o alinhamento cruzado da coluna/linha
            // Esse para funcionar corretamente, precisamos definir o tamanho da tela.
            // crossAxisAlignment: CrossAxisAlignment.start,
            // Utilizando Column e Row, nós temos children, pois temos vários valores
          
          // Com esse builder, posso fazer:

          itemCount: listaFavorita.length,
          itemBuilder: (context, index){
            return ListTile(
                title: Text(listaFavorita[index]),
              );
          },
          // children: [
          //   for (var i = 0; i < 10; i++)
          //     Container(
          //       color: Colors.red,
          //       width: double.infinity,
          //       height: 80,
          //       margin: const EdgeInsets.all(12), //Define uma distância
          //     ),
          //   Text('Flutterando $counter')
          // ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Exige algumas propriedades

        // Adiciona um icone
        child: const Icon(Icons.arrow_right_rounded),
        // Ao clicar, chamará essa função anonima (pois não está com nome)
        onPressed: () {
          // print('clicou');

          // Ao apenas colocar o counter, direto na tela: body: Center(child: Text('Flutterando $counter')),
          // Não funciona, pois precisa recarregar os valores da página (Hot Reload), para isso, usamos o setState()
          setState(() {
            //Boa prática adicionarmos dentro dessa função anonima, tudo que será alterado
            // counter++;
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SecondPage()),
            );
          }); //Funciona apenas dentro de uma classe State
        },
      ),
      
    );
  }
}

// sft -> Atalho do VSCODE para gerar essa estrutura do StatefulWidget

