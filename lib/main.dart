import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pub/src/core/getIt/register_dependencies.dart';
import 'package:pub/src/features/details_post/presentation/pages/details_post_page.dart';
import 'package:pub/src/features/details_pub/presentation/pages/details_pub_page.dart';
import 'package:pub/src/features/home/presentation/pages/home_page.dart';
import 'package:pub/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:pub/src/core/geolocator/location_controller.dart';
import 'package:pub/src/shared/helpers/local_storage.dart';
import 'package:pub/src/shared/helpers/navigator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetItCore(GetIt.instance).init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pub',
      navigatorKey: NavigatorCustom.navigatorKey,
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
      home: const SplashPage(),
      onGenerateRoute: (settings) {
        if (settings.name == '/onboarding') {
          return MaterialPageRoute(
            builder: (context) => const OnboardingPage(),
          );
        }
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

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkInitialDependencies();
    super.initState();
  }

  Future<void> checkInitialDependencies() async {
    //VERIFICA LOCALIZAÇAO
    await GetIt.I.get<LocationController>().getPosition();

    //VERIFICAR ONBOARDING
    await verificarOnboarding();
  }

  Future<void> verificarOnboarding() async {
    bool isOpenedOnboarding =
        await LocalStorageCustom.getBool('isOpenedOnboarding');
    if (isOpenedOnboarding) {
      NavigatorCustom().pushReplacementNamed('/home');
    } else {
      NavigatorCustom().pushReplacementNamed('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
