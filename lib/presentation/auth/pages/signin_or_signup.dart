import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/appbar/app_bar.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/presentation/auth/pages/signin.dart';
import 'package:spotify_app/presentation/auth/pages/signup.dart';

class SigninOrSignupPage extends StatelessWidget {
  const SigninOrSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BasicAppbar(),
        Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern)),
        Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern)),
        Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBackground)),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(AppVectors.logo),
              const SizedBox(height: 40),
              Text(
                'Enjoy Listening to Music.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                'Millions of songs and podcasts. No credit card needed.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Row(children: [
                Expanded(
                    flex: 1,
                    child: BasicAppButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignupPage()));
                        },
                        title: 'Register')),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SigninPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              width: 2.0),
                          borderRadius: BorderRadius.circular(30.0)),
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 20.0),
                      child: Center(
                        child: Text('Sign In',
                            style: TextStyle(
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ]),
    );
  }
}
