import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/features/home/presentation/controllers/discovery_controller.dart';

class HighlightedPostsWidget extends StatefulWidget {
  const HighlightedPostsWidget({super.key});

  @override
  State<HighlightedPostsWidget> createState() => _HighlightedPostsWidgetState();
}

class _HighlightedPostsWidgetState extends State<HighlightedPostsWidget> {
  DiscoveryController? _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<DiscoveryController>();
    _controller?.getHighLightedPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 0, left: 24, bottom: 24),
        child: SizedBox(
          height: 200,
          child: (_controller?.highlightedLoading ?? false)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _controller?.highlightedPosts?.list?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/details-post', arguments: {
                          'entity': _controller?.highlightedPosts?.list?[i]
                        }),
                        child: SizedBox(
                          width: 300,
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(_controller
                                          ?.highlightedPosts
                                          ?.list?[i]
                                          .imageUrl ??
                                      ''),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 10,
                                            blurRadius: 20,
                                            offset: const Offset(0, 10),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _controller?.highlightedPosts
                                                      ?.list?[i].title ??
                                                  '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              _controller?.highlightedPosts
                                                      ?.list?[i].pubName ??
                                                  '',
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      );
    });
  }
}
