import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/features/home/presentation/controllers/discovery_controller.dart';
import 'package:pub/src/features/home/presentation/pages/discovery_page.dart';
import 'package:pub/src/features/home/presentation/pages/maps_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;
  DiscoveryController? _controller;
  final bool isGpsActive = false;
  @override
  void initState() {
    _controller = GetIt.I.get<DiscoveryController>();
    _controller?.initLoadingPosts();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          DiscoveryPage(),
          MapsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
          _pageController.jumpToPage(i);
        },
        elevation: 0,
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.surface,
        ),
        unselectedItemColor: Theme.of(context).colorScheme.surface,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Posts',
            tooltip: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
            tooltip: 'Mapa',
          ),
        ],
      ),
    );
  }
}
