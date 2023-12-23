// O Flutter é daclarativo, pois utilizamos linguagem de programação para desenvolver as telas
// Diferente do React Native, onde utilizamos marcação com tags.

// Como não podemos estanciar uma class abstrata, precisamos implementar, extender ou herdar a class Widget.
import 'package:flutter/material.dart';
import 'package:ola_mundo/controller/home_controller.dart';
import 'package:ola_mundo/pages/home_page.dart';

class MyApp extends StatelessWidget {
  // Necessário uma chave, e assim que definimos
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // MaterialApp é um Widget que é necessário apenas uma vez na aplicação, usamos geralmente no começo da aplicação
    // Utilizamos para conseguir as estilizações automaticamente
    return MaterialApp(
      // Dentro dele recebemos várias propriedades, entre elas, a home (principal)
      home: HomeController(child: const HomePage()),
          // Dessa forma acima, estamos transformando o HomeController em pai do HomePage, assim
          // é possível acessar os dados de HomeController dentro do HomePage
    );
  }
}
