import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/features/home/presentation/controllers/discovery_controller.dart';
import 'package:pub/src/features/home/presentation/widgets/highlighted_posts_widget.dart';
import 'package:pub/src/features/home/presentation/widgets/posts_nearest_widget.dart';
import 'package:pub/src/features/home/presentation/widgets/posts_promotions_widget.dart';
import 'package:pub/src/features/home/presentation/widgets/posts_today_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final bool isGpsActive = false;
  DiscoveryController? _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<DiscoveryController>();
    super.initState();
  }

  void _onRefresh() async {
    _controller?.onRefresh();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Posts',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isGpsActive)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Ativar localização',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(
                    left: 24, top: isGpsActive ? 24 : 0, bottom: 12),
                child: const Align(
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
              const HighlightedPostsWidget(),
              const Padding(
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
              const PostsNearestWidget(),
              const Padding(
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
              const PostsPromotionsWidget(),
              const Padding(
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
              const PostsTodayWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
