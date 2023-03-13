import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_practice/features/auth/login/bloc/login_bloc.dart';
import 'package:flutter_practice/features/auth/login/login_page.dart';
import 'package:flutter_practice/features/auth/repositories/auth_repo.dart';
import 'package:flutter_practice/features/auth/registration/registration_page.dart';
import 'package:flutter_practice/features/main/bloc/filter_card_password/filter_card_password_bloc.dart';
import 'package:flutter_practice/features/main/bloc/card_password_bloc.dart';
import 'package:flutter_practice/generated/l10n.dart';
import 'package:flutter_practice/features/misc/add_card_password_page.dart';
import 'core/themes/theme.dart';
import 'features/main/home_page.dart';
import 'features/welcome/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_practice/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp() // Wrap your app
        ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepo(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                LoginBloc(repo: RepositoryProvider.of<AuthRepo>(context)),
          ),
          BlocProvider(
            create: (context) => CardPasswordBloc(),
          ),
          BlocProvider(
            create: (context) => FilterCardPasswordBloc(),
          ),
        ],
        child: MaterialApp(
            locale: const Locale('en', 'US'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: '/', // this is 'root'
            routes: {
              '/WelcomePage': (context) => const WelcomeScreen(),
              '/RegisterPage': (context) => const RegisterPage(),
              '/LoginPage': (context) => const LoginPage(),
              '/HomePage': (context) => const HomePage(),
              '/AddCardPasswordPage': (context) => const AddCardPasswordPage(),
            },
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            builder: DevicePreview.appBuilder,
            title: 'Flutter Demo',
            theme: MPTheme.lightTheme,
            home: const WelcomeScreen()),
      ),
    );
  }
}
