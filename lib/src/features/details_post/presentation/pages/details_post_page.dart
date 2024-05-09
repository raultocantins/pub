import 'package:flutter/material.dart';
import 'package:pub/src/features/home/domain/entities/post_entity.dart';
import 'package:pub/src/shared/helpers/format_date.dart';

class DetailsPostPage extends StatefulWidget {
  final PostEntity entity;
  const DetailsPostPage({super.key, required this.entity});

  @override
  State<DetailsPostPage> createState() => _DetailsPostPageState();
}

class _DetailsPostPageState extends State<DetailsPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
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
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrição',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '🍻 Não perca nossa Promoção de Chopp Especial Hoje! 🍻Junte-se a nós hoje à noite no nosso querido bar para uma noite inesquecível de diversão e sabor! Para tornar a sua experiência ainda mais incrível, estamos oferecendo uma promoção especial de chopp que você não vai querer perder!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Transform.rotate(
          angle: 45 * 3.1415926535 / 180,
          child: const Icon(
            Icons.navigation_rounded,
          ),
        ),
      ),
    );
  }
}
