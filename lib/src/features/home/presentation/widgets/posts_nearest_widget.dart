import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/features/home/presentation/controllers/discovery_controller.dart';
import 'package:pub/src/shared/widgets/card_small_empty.dart';
import 'package:pub/src/shared/widgets/card_small_error.dart';
import 'package:pub/src/shared/widgets/list_small_shimmer.dart';

class PostsNearestWidget extends StatefulWidget {
  const PostsNearestWidget({super.key});

  @override
  State<PostsNearestWidget> createState() => _PostsNearestWidgetState();
}

class _PostsNearestWidgetState extends State<PostsNearestWidget> {
  DiscoveryController? _controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _controller = GetIt.I.get<DiscoveryController>();

    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent &&
            !(_controller?.nearestLoading ?? false) &&
            (_controller?.nearestPosts?.list?.length ?? 0) % 10 == 0) {
          _controller?.getNearestPosts();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (contex) {
      return Padding(
        padding: const EdgeInsets.only(top: 0, left: 24, bottom: 24),
        child: SizedBox(
          height: 100,
          child: (_controller?.nearestLoading ?? false) &&
                  (_controller?.nearestPosts == null)
              ? const ListSmallShimmerWidget()
              : (_controller?.highlightedError ?? false)
                  ? CardSmallError(
                      onPressed: () => _controller?.getNearestPosts(),
                    )
                  : (_controller?.nearestPosts?.list?.isEmpty ?? false)
                      ? const CardSmallEmpty()
                      : SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      _controller?.nearestPosts?.list?.length ??
                                          0,
                                  itemBuilder: (BuildContext context, int i) {
                                    return GestureDetector(
                                      onTap: () => Navigator.of(context)
                                          .pushNamed('/details-post',
                                              arguments: {
                                            'entity': _controller
                                                ?.nearestPosts?.list?[i]
                                          }),
                                      child: SizedBox(
                                        width: 300,
                                        height: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Card(
                                                color: Colors.transparent,
                                                child: Container(
                                                  height: 100,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        _controller
                                                                ?.nearestPosts
                                                                ?.list?[i]
                                                                .imageUrl ??
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
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 5,
                                                      horizontal: 3),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        _controller
                                                                ?.nearestPosts
                                                                ?.list?[i]
                                                                .title ??
                                                            '',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      Text(
                                                        _controller
                                                                ?.nearestPosts
                                                                ?.list?[i]
                                                                .pubName ??
                                                            '',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
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
                              if (_controller?.nearestLoading ?? false)
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                            ],
                          ),
                        ),
        ),
      );
    });
  }
}
