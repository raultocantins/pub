import 'package:flutter/material.dart';

class DetailsPubPage extends StatefulWidget {
  final String id;
  const DetailsPubPage({super.key, required this.id});

  @override
  State<DetailsPubPage> createState() => _DetailsPubPageState();
}

class _DetailsPubPageState extends State<DetailsPubPage> {
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
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://www.mytapp.com.br/wp-content/uploads/2022/10/atrair_mais_clientes_bar.webp',
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Text(
                'Bixxos Bar',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: 4,
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
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    'https://s2-techtudo.glbimg.com/-5_mIAH6B33Ub6P8RRk834bnaAE=/0x0:1280x720/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2020/l/p/P7byPHQHSBtN4q9ncthg/maxresdefault.jpg',
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
            const ListTile(
              title: Text(
                'Endereço',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '1004sul alameda 14 lote 04',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              title: Text(
                'Contato',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '(63) 992086480',
                style: TextStyle(color: Colors.white),
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
