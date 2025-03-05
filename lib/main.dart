import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_beautiful_checklist_exercise/shared/shared_preferences_repository.dart';
import 'features/splash/splash_screen.dart';
import 'home_screen.dart';

void main() async {
  // Wird benötigt, um auf SharedPreferences zuzugreifen
  WidgetsFlutterBinding.ensureInitialized();

  // Instanziiere das SharedPreferencesRepository und initialisiere es
  final SharedPreferencesRepository repository = SharedPreferencesRepository();
  await repository.getItems(); // Initialisiere SharedPreferences

  runApp(MainApp(repository: repository));
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.repository,
  });

  final SharedPreferencesRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.robotoMonoTextTheme(Theme.of(context).textTheme),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.robotoMonoTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
      ),
      themeMode: ThemeMode.system,
      title: 'Checklisten App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => HomeScreen(
              repository: repository,
            ),
      },
    );
  }
}
