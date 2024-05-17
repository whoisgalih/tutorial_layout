import 'package:flutter/material.dart';
import 'main.dart';
import 'tutorial11.2.dart';

void main() {
  runApp(const MyApp11_1());
}

class MyApp11_1 extends StatelessWidget {
  const MyApp11_1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABP Minggu 11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ABP Minggu 11'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  PageController pc = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: pc,
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          children: [
            Center(
                child: InkWell(
              child:
                  const Text('Go to Home page', style: TextStyle(fontSize: 30)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
            )),
            const MyApp11_2(),
            const Center(
              child: Text('Profile page', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pc.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
