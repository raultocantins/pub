import 'package:flutter/material.dart';
import 'package:pub/src/features/home/presentation/widgets/highlighted_posts_widget.dart';
import 'package:pub/src/features/home/presentation/widgets/posts_nearest_widget.dart';
import 'package:pub/src/features/home/presentation/widgets/posts_promotions_widget.dart';
import 'package:pub/src/features/home/presentation/widgets/posts_today_widget.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Discovery',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24, top: 24, bottom: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Destaques",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            HighlightedPostsWidget(),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mais próximos",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            PostsNearestWidget(),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Promoções",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            PostsPromotionsWidget(),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "De hoje",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            PostsTodayWidget(),
          ],
        ),
      ),
    );
  }
}
