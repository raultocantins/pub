import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/features/details_pub/presentation/controllers/detail_pub_controller.dart';
import 'package:pub/src/shared/helpers/url_launcher.dart';

class DetailsPubPage extends StatefulWidget {
  final String pubId;
  final String pubImageUrl;
  final String pubName;
  const DetailsPubPage({
    super.key,
    required this.pubId,
    required this.pubImageUrl,
    required this.pubName,
  });

  @override
  State<DetailsPubPage> createState() => _DetailsPubPageState();
}

class _DetailsPubPageState extends State<DetailsPubPage> {
  DetailPubController? _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<DetailPubController>();
    _controller?.getDetailPub(widget.pubId);
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Container(
              width: double.infinity,
              height: 120,
              color: Theme.of(context).colorScheme.background,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.pubImageUrl,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Observer(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Text(
                widget.pubName,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
            (_controller?.isLoading ?? false)
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: _controller?.entity?.images.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: GestureDetector(
                                  child: SizedBox(
                                    width: 150,
                                    child: Card(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              _controller?.entity?.images[i] ??
                                                  '',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Endereço',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _controller?.entity?.address ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Contato',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _controller?.entity?.contactNumber ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
          ],
        );
      }),
      floatingActionButton: Observer(builder: (context) {
        return FloatingActionButton(
          onPressed: (_controller?.isLoading ?? false) ||
                  (_controller?.isError ?? false)
              ? null
              : () =>
                  UrlLauncherCustom.launchMaps(_controller?.entity?.location),
          child: (_controller?.isLoading ?? false)
              ? const CircularProgressIndicator()
              : Transform.rotate(
                  angle: 45 * 3.1415926535 / 180,
                  child: const Icon(
                    Icons.navigation_rounded,
                  ),
                ),
        );
      }),
    );
  }
}
