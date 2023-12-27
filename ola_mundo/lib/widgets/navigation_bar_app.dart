import 'package:flutter/material.dart';
import 'package:ola_mundo/pages/home_page.dart';
import 'package:ola_mundo/pages/second_page.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF151026),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xFF151026),
        )
      ),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.storefront_rounded,
              color: Color(0xFF0601B4),
            ),
            icon: Icon(Icons.storefront, color: Color(0xFF9492DE)),
            label: 'Lojas',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.favorite,
              color: Color(0xFF0601B4),
            ),
            icon: Icon(
              Icons.favorite,
              color: Color(0xFF9492DE),
            ),
            label: 'Favoritos',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.settings,
              color: Color(0xFF0601B4),
            ),
            icon: Icon(
              Icons.settings,
              color: Color(0xFF9492DE),
            ),
            label: 'Configurações',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const HomePage(),

        /// Notifications page
        const SecondPage(),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),
      ][currentPageIndex],
    );
  }
}
