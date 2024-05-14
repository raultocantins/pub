import 'package:flutter/material.dart';
import 'package:pub/src/shared/helpers/local_storage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<StepPage> steps = [
    StepPage(
        title: 'Encontre bares e restaurantes',
        description:
            'Agora encontrar os melhores bares e restaurantes ficou ainda mais fácil com o pubapp.',
        imagePath: 'assets/images/step1.jpg'),
    StepPage(
        title: 'Filtros de pesquisa\navançados',
        description:
            'Encontre os estabelecimentos por gênero musical, distância e muito mais.',
        imagePath: 'assets/images/step2.jpg'),
    StepPage(
        title: 'Tudo em um único\nlugar',
        description:
            'Promoções e eventos em um único aplicativo, agora fica fácil achar um lugar para sair e se divertir.',
        imagePath: 'assets/images/step3.jpg')
  ];
  final PageController _pageController = PageController(initialPage: 0);
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          itemCount: steps.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(steps[i].imagePath),
                    fit: BoxFit.cover,
                    opacity: 0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.1),
                            spreadRadius: 30,
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      height: 250,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            steps[i].title,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            steps[i].description,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (page < 2 && page > 0)
                                  IconButton(
                                    onPressed: () {
                                      if (page != 0) {
                                        setState(() {
                                          page = page - 1;
                                        });
                                        _pageController.jumpToPage(page);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_circle_left,
                                      size: 50,
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                  ),
                                if (page == 2)
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary)),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/home');
                                      LocalStorageCustom.setBool(
                                          'isOpenedOnboarding', true);
                                    },
                                    child: const Text(
                                      'Finalizar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                else
                                  IconButton(
                                    onPressed: () {
                                      if (page < 2) {
                                        setState(() {
                                          page = page + 1;
                                        });
                                        _pageController.jumpToPage(page);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_circle_right,
                                      size: 50,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class StepPage {
  final String title;
  final String description;
  final String imagePath;
  StepPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
