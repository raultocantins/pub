import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/core/getIt/register_dependencies.dart';
import 'package:pub/src/features/details_post/presentation/pages/details_post_page.dart';
import 'package:pub/src/features/details_pub/presentation/pages/details_pub_page.dart';
import 'package:pub/src/features/home/presentation/pages/home_page.dart';
import 'package:pub/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:pub/src/shared/helpers/local_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetItCore(GetIt.instance).init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> verificarOnboarding() async {
    bool isOpenedOnboarding =
        await LocalStorageCustom.getBool('isOpenedOnboarding');
    if (isOpenedOnboarding) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          background: Colors.black,
          primary: const Color(0xffEA1763),
          secondary: const Color(0xffFFFFFF),
          surface: const Color(0xff646464),
        ),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: verificarOnboarding(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else {
            final bool onboardingMostrado = snapshot.data ?? false;
            return onboardingMostrado
                ? const HomePage()
                : const OnboardingPage();
          }
        },
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return MaterialPageRoute(
            builder: (context) => const HomePage(),
          );
        }
        if (settings.name == '/details-post') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DetailsPostPage(
              entity: args['entity'],
            ),
          );
        }
        if (settings.name == '/details-pub') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DetailsPubPage(
              pubId: args['pubId'],
              pubImageUrl: args['pubImageUrl'],
              pubName: args['pubName'],
            ),
          );
        }
        return null;
      },
    );
  }
}
