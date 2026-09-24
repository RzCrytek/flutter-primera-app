import 'package:flutter/material.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/preferences/preference_service.dart';

class WelcomeWidget extends StatelessWidget {
  final Size size;
  final String title;
  final String description;
  final String asset;
  final Color bgColor;
  final bool showButton;

  WelcomeWidget({
    super.key,
    required this.size,
    required this.title,
    required this.description,
    required this.asset,
    required this.bgColor,
    this.showButton = false,
  });

  final PreferenceService preferenceService = PreferenceService();

  Future<void> setVisitWelcomePage() async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // await sharedPreferences.setBool("visitWelcomePage", true);

    preferenceService.setVisitWelcome();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(32),
      margin: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: bgColor,
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset("assets/images/$asset.png", height: size.height / 5),
          SizedBox(height: 32),
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: .bold,
              color: Colors.white,
            ),
          ),
          Text(
            description,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          showButton
              ? Padding(
                  padding: EdgeInsetsGeometry.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      setVisitWelcomePage();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text("Vamos!"),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
