import 'package:flutter/material.dart';

// Page -> São Widgets que ocupam a tela inteira
// Widgets -> Representam alguns pixels da tela, semelhante ao HTML
// Widgte -> É uma class abstrata
void main() {
  // Utilizamos o runApp para colocar o widget na tela
  runApp(const MyApp());
}

// O Flutter é daclarativo, pois utilizamos linguagem de programação para desenvolver as telas
// Diferente do React Native, onde utilizamos marcação com tags.

// Como não podemos estanciar uma class abstrata, precisamos implementar, extender ou herdar a class Widget.
class MyApp extends StatelessWidget {
  // Necessário uma chave, e assim que definimos
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // MaterialApp é um Widget que é necessário apenas uma vez na aplicação, usamos geralmente no começo da aplicação
    // Utilizamos para conseguir as estilizações automaticamente
    return const MaterialApp(
      // Dentro dele recebemos várias propriedades, entre elas, a home (principal)
      home: HomePage(),
    );
  }
}

// Componetizando os itens
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // Center é um Widget para centralizar
    // Text é um Widget para texto

    // Existem dois Widgets que fazem herança das coisas do MaterialApp em uma página:
      // São eles: Material e Scaffold
    return const Material(child: Center(child: Text('Flutterando')));
  }
}
