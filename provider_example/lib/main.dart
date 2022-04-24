import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/providers/shopping_cart_provider.dart';
import 'package:provider_example/screens/home_screen.dart';
import 'package:provider_example/screens/second_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => ShoppingCart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      MyHomePage(),
      SecondScreen(
        message: '',
        title: '',
      ),
    ];

    return MaterialApp(
      home: Scaffold(
          body: PageView(
            controller: _pageController,
            //The following parameter is just to prevent
            //the user from swiping to the next page.
            physics: NeverScrollableScrollPhysics(),
            children: _widgetOptions,
          ),

          // Center(
          //   child: _widgetOptions.elementAt(_selectedIndex),
          // ),
          bottomNavigationBar: GestureDetector(
            onDoubleTap: () {
              print("hi");
            },
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "home"),
                BottomNavigationBarItem(icon: Icon(Icons.message), label: "home"),
                BottomNavigationBarItem(icon: Icon(Icons.table_chart), label: "home"),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "home"),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFF334192),
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                  _pageController.jumpToPage(_selectedIndex);
                });
              },
            ),
          )),
    );
  }
}

// class MyApp2 extends StatelessWidget {
//   MyApp2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/': (context) => MyHomePage(),
//         '/second': (context) => SecondScreen({),
//       },
//     );
//   }
// }
