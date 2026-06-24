import 'package:flutter/material.dart';
import 'pages/about_page.dart';
import 'pages/research_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(const PortafolioApp());
}

class _NoScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class PortafolioApp extends StatelessWidget {
  const PortafolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Portafolio',
      builder: (context, child) => ScrollConfiguration(
        behavior: _NoScrollbarBehavior(),
        child: child!,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 175,
          titleSpacing: 0,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8),
              CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage('assets/icons/perfil.png'),
              ),
              SizedBox(height: 8),
              Text(
                'Diego Chancafe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Estudiante de Física',
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ],
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Material(
              color: Colors.white,
              child: const TabBar(
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                indicatorColor: Colors.deepPurple,
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  Tab(icon: Icon(Icons.person), text: 'Sobre Mí'),
                  Tab(icon: Icon(Icons.work_history), text: 'Proyectos'),
                  Tab(icon: Icon(Icons.email), text: 'Contacto'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            AboutPage(),
            ResearchPage(),
            ContactPage(),
          ],
        ),
      ),
    );
  }
}
