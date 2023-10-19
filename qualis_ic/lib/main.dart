import 'package:flutter/material.dart';
import 'package:qualis_ic/views/conferencias_list.dart';
import 'package:qualis_ic/views/livros_list.dart';
import 'package:qualis_ic/views/periodicos_list.dart';
import 'package:qualis_ic/service/atualizaJson.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await copyAssetsToDocumentsDirectory();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qualis IC App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [ConferenciasPage(), PeriodicosPage(), TodosPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qualis IC App'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Conferências',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: 'Periódicos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Correlação',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
