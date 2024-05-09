import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/features/home/presentation/controllers/discovery_controller.dart';

class PostsNearestWidget extends StatefulWidget {
  const PostsNearestWidget({super.key});

  @override
  State<PostsNearestWidget> createState() => _PostsNearestWidgetState();
}

class _PostsNearestWidgetState extends State<PostsNearestWidget> {
  DiscoveryController? _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<DiscoveryController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 24, bottom: 24),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _controller?.nearestPosts?.list?.length,
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/details-post',
                  arguments: {
                    'imageUrl': _controller?.nearestPosts?.list?[i].imageUrl
                  }),
              child: SizedBox(
                width: 300,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        child: Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                _controller?.nearestPosts?.list?[i].imageUrl ??
                                    '',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      SizedBox(
                        height: 100,
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _controller?.nearestPosts?.list?[i].title ?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              _controller?.nearestPosts?.list?[i].pubName ?? '',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              _controller?.nearestPosts?.list?[i].date
                                      .toString() ??
                                  '',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 11),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
