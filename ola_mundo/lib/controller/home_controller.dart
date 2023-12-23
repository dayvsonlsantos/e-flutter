// Uma das formas de controlar states no Flutter, é usando o InheritedWidget
    // class HomeController extends InheritedWidget {
// Porém para fazer modificações, e elas serem refletidas, precisamos utilizar o InheritedNotifier
import 'package:flutter/material.dart';

// O InheritedNotifier pede uma listen enable, exemplo com a reatividade do ValueNotifier.
class HomeController extends InheritedNotifier<ValueNotifier<int>> {

  // Ao usar o ValueNotifier, precisamos iniciar essa reatividade
  HomeController({Key? key, required Widget child})
      : super(
        key: key, 
        child: child,
        notifier: ValueNotifier(0), //Iniciando a reatividade do ValueNotifier
      );

  // Feito isso, para reduzir e simplificar o código em HomePage
  static HomeController of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<HomeController>()!;
  }

  // Pego o valor do value, do notifier.value
  int get value => notifier!.value;

  // Agora, com o notifier, posso criar funções:
  increment(){
    notifier!.value++;
  }



  // Primeiro ele vai te pedir duas coisas:
  // Se pode atualizar os filhos
  // E você precisa passar um widget para o filho dele
  // Basicamente, ele vai ser um interceptador

  // Com o InheritedNotifier, não preciso mais do código abaixo
    // @override
    // bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    //   return false;
    // }
}

// Para pegar esse HomeController dentro do HomePage, vamos precisar transformar o
// HomeController em pai do HomePage. Para isso, vamos em MyApp
