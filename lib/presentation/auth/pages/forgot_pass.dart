import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/forgot_pass_user_req.dart';
import 'package:spotify/domain/usecases/auth/forgotpass.dart';
import 'package:spotify/service_locator.dart';

class ForgotPassPage extends StatelessWidget {
  final TextEditingController _forgotPass = TextEditingController();
  ForgotPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        picture: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 1),
              _forgotPassField(context),
              const SizedBox(height: 30),
              BasicAppButton(
                  onPressed: () async {
                    var response = await sl<ForgotpassUseCase>().call(
                      params: ForgotPassUserReq(
                        email: _forgotPass.text.toString(),
                      ),
                    );
                    return response.fold((l) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l),
                          behavior: SnackBarBehavior.fixed,
                        ),
                      );
                    }, (r) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(r),
                          behavior: SnackBarBehavior.fixed,
                        ),
                      );
                    });
                  },
                  title: 'Send Email'),
              const Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _forgotPassField(BuildContext context) {
    return TextField(
      controller: _forgotPass,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(hintText: 'Please Enter your email'),
    );
  }
}
