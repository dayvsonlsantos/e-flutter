// Componetizando os itens
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // Center é um Widget para centralizar
    // Text é um Widget para texto

    // Existem dois Widgets que fazem herança das coisas do MaterialApp em uma página:
    // São eles: Material e Scaffold
    // O que ganho ao utilizar o Scaffold ? Ganhamos uma serie de propriedades que
    // vão fazer você criar a sua tela. Exemplo: appBar: AppBar() -> Recebe um Widget AppBar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Flutterando')
      ),
      floatingActionButton: FloatingActionButton(
        // Exige algumas propriedades
        
        // Adiciona um icone
        child: const Icon(Icons.add),
        // Ao clicar, chamará essa função anonima (pois não está com nome)
        onPressed: () {
          // print('clicou');
        },
      ),
    );
  }
}
