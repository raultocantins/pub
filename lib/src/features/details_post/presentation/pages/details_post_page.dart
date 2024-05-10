import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/features/details_post/presentation/controllers/detail_post_controller.dart';
import 'package:pub/src/features/home/domain/entities/post_entity.dart';
import 'package:pub/src/shared/helpers/format_date.dart';
import 'package:pub/src/shared/helpers/url_launcher.dart';

class DetailsPostPage extends StatefulWidget {
  final PostEntity entity;
  const DetailsPostPage({super.key, required this.entity});

  @override
  State<DetailsPostPage> createState() => _DetailsPostPageState();
}

class _DetailsPostPageState extends State<DetailsPostPage> {
  DetailPostController? _controller;
  @override
  void initState() {
    _controller = GetIt.I.get<DetailPostController>();
    _controller?.getDetail(widget.entity.id);
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
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          widget.entity.imageUrl,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Text(
                  widget.entity.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pushNamed('/details-pub',
                    arguments: {'id': widget.entity.pubId}),
                title: Text(
                  widget.entity.pubName,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Data do post: ${FormatDateCustom.dateWithHours(widget.entity.date)}',
                  style: const TextStyle(color: Colors.white),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.entity.pubImageUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Descrição',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    (_controller?.isLoading ?? false)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            _controller?.entity?.description ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
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
