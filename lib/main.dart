import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ar']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Center(
          child: LocaleText('english'),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LocaleText(
                "welcome",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        child: const Icon(
          Icons.language_outlined,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LanguagePage(),
          ),
        ),
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const LocaleText("language"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("English"),
            onTap: () => LocaleNotifier.of(context)!.change('en'),
          ),
          ListTile(
            title: const Text("العربية"),
            onTap: () => LocaleNotifier.of(context)!.change('ar'),
          ),
        ],
      ),
    );
  }
}
