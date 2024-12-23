import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/widgets/appbar/app_bar.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';
import 'package:spotify_app/domain/usecases/auth/signin.dart';
import 'package:spotify_app/presentation/auth/pages/signup.dart';
import 'package:spotify_app/presentation/home/pages/home.dart';
import 'package:spotify_app/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 30,
          width: 30,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            const SizedBox(height: 50),
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SigninUseCase>().call(
                  params: SigninUserReq(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
                result.fold(
                  (l) => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to sign in'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  ),
                  (r) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()),
                    (route) => false,
                  ),
                );
              },
              title: 'Sign In',
            ),
          ],
        ),
      ),
      bottomNavigationBar: _newUserText(context),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _newUserText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('New to Spotify? ',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SignupPage()));
            },
            child: const Text('Register now'),
          ),
        ],
      ),
    );
  }
}
