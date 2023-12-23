// Componetizando os itens
import 'package:flutter/material.dart';
import 'package:ola_mundo/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {

    // O context representa a aplicação inteira, como um todo.
      // Ele nunca deve ser armazenado, e devemos sempre buscar usar ele dentro do método build

    // Para recuperar os valores, utilizamos esse context

    // Passo a !, pois o valor pode ser nulo
    var controller = HomeController.of(context);
    // Como o ValueNotifier é uma reatividade, e temos esse dependOnInheritedWidgetOfExactType
    // Isso significa que sempre que alterarmos o valor, nesse caso incrementar,
    // Por termos usado o dependOnInheritedWidgetOfExactType, ele irá automaticamente
    // atualizar o homePage

    

    // Existem dois Widgets que fazem herança das coisas do MaterialApp em uma página:
    // São eles: Material e Scaffold
    // O que ganho ao utilizar o Scaffold ? Ganhamos uma serie de propriedades que
    // vão fazer você criar a sua tela. Exemplo: appBar: AppBar() -> Recebe um Widget AppBar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      // Center é um Widget para centralizar
      // Text é um Widget para texto
      body: Center(
        child: Text('Flutterando ${controller.value}')
      ),
      floatingActionButton: FloatingActionButton(
        // Exige algumas propriedades
        
        // Adiciona um icone
        child: const Icon(Icons.add),
        // Ao clicar, chamará essa função anonima (pois não está com nome)
        onPressed: () {
          // print('clicou');
          controller.increment();
        },
      ),
    );
  }
}