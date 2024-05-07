import 'package:flutter/material.dart';

class PostsWidget extends StatefulWidget {
  const PostsWidget({super.key});

  @override
  State<PostsWidget> createState() => _PostsWidgetState();
}

class _PostsWidgetState extends State<PostsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 24, bottom: 24),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/details-post',
                  arguments: {
                    'imageUrl':
                        'https://img.abcfc.com.br/uploads/2017/10/promo_cerveja_vitrine.png'
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
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                'https://img.abcfc.com.br/uploads/2017/10/promo_cerveja_vitrine.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const SizedBox(
                        height: 100,
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prepare for your first skateboard jump',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              'Bixxos bar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              '04/05/2024 ás 20:38',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
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
