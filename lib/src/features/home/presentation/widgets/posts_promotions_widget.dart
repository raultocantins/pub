import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/features/home/presentation/controllers/discovery_controller.dart';
import 'package:pub/src/shared/widgets/card_small_empty.dart';
import 'package:pub/src/shared/widgets/card_small_error.dart';
import 'package:pub/src/shared/widgets/list_small_shimmer.dart';

class PostsPromotionsWidget extends StatefulWidget {
  const PostsPromotionsWidget({super.key});

  @override
  State<PostsPromotionsWidget> createState() => _PostsPromotionsWidgetState();
}

class _PostsPromotionsWidgetState extends State<PostsPromotionsWidget> {
  DiscoveryController? _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<DiscoveryController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 0, left: 24, bottom: 24),
        child: SizedBox(
          height: 100,
          child: (_controller?.promotionsLoading ?? false)
              ? const ListSmallShimmerWidget()
              : (_controller?.promotionsError ?? false)
                  ? CardSmallError(
                      onPressed: () => _controller?.getPromotionsPosts(),
                    )
                  : (_controller?.promotionsPosts?.list?.isEmpty ?? false)
                      ? const CardSmallEmpty()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              _controller?.promotionsPosts?.list?.length ?? 0,
                          itemBuilder: (BuildContext context, int i) {
                            return GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed('/details-post', arguments: {
                                'entity': _controller?.promotionsPosts?.list?[i]
                              }),
                              child: SizedBox(
                                width: 300,
                                height: 100,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Card(
                                        child: Container(
                                          height: 100,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                _controller?.promotionsPosts
                                                        ?.list?[i].imageUrl ??
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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 3),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _controller?.promotionsPosts
                                                        ?.list?[i].title ??
                                                    '',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const Expanded(child: SizedBox()),
                                              Text(
                                                _controller?.promotionsPosts
                                                        ?.list?[i].pubName ??
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
      );
    });
  }
}
