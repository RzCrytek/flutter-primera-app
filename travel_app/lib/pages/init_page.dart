import 'package:flutter/material.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/welcome_page.dart';
import 'package:travel_app/preferences/preference_service.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  bool visitWelcomePage = false;

  PreferenceService preferenceService = PreferenceService();

  void cargarVisitWelcomePage() async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // print(visitWelcomePage);
    // visitWelcomePage = sharedPreferences.getBool("visitWelcomePage") ?? false;
    visitWelcomePage = (await preferenceService.getVisitWelcomePage() ?? false);
    print(visitWelcomePage);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    cargarVisitWelcomePage();
  }

  @override
  Widget build(BuildContext context) {
    return visitWelcomePage ? HomePage() : WelcomePage();
  }
}
