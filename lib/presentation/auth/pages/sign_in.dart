import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/sign_up.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signUpText(context),
      appBar: BasicAppBar(
        picture: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 30),
              BasicAppButton(onPressed: () {}, title: 'Create Account'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(hintText: 'Enter Email'),
    );
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signUpText(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a Member?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: const Text('Register Now'),
          )
        ],
      ),
    );
  }
}
