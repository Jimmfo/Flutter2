import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/first': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                'Menu',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30),
              ),
            ),

            ListTile(
              title: const Text('Clase_de_prueba'),
              leading: const Icon(
                Icons.account_balance_sharp,
                color: Color.fromARGB(255, 200, 100, 100),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ClasePrueba()));
              },
            ),


            ListTile(
              title: const Text('Hotel'),
              leading: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 200, 100, 100),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Hotel()));
              },
            ),
            ListTile(
              title: const Text('Reservar'),
              leading: const Icon(
                Icons.group,
                color: Colors.indigo,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Reservar())
                );
              },
            ),
            ListTile(
              title: const Text('Precio'),
              leading: const Icon(
                Icons.category,
                color: Colors.indigo,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Precio()));
              },
            ),
            ListTile(
              title: const Text('Inventario'),
              leading: const Icon(
                Icons.book,
                color: Color.fromARGB(255, 0, 0, 255),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Inventario()));
              },
            ),
            ListTile(
              title: const Text('Habitacion'),
              leading: const Icon(
                Icons.bookmark,
                color: Colors.deepOrange,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Habitacion()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Launch screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Hotel extends StatelessWidget {
  const Hotel ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotel')),
      body: const Center(
        child: Text('Página de hoteles'),
      ),
    );
  }
}

class Reservar extends StatelessWidget {
  const Reservar ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservar')),
      body: const Center(
        child: Text('Página de reservaciones'),
      ),
    );
  }
}

class Precio extends StatelessWidget {
  const Precio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Precios'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Regresar'),
        ),
      ),
    );
  }
}


class Inventario extends StatelessWidget {
  const Inventario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),
      ),
      body: const Center(
        child: Text('Inventario de productos'),
      ),
    );
  }
}


class Habitacion extends StatelessWidget {
  const Habitacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habitacion'),
      ),
      body: const Center(
        child: Text('Página de habitaciones'),
      ),
    );
  }
}


// ////////////////////////////////////
// método fetchAlbum
// ////////////////////////////////////

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
