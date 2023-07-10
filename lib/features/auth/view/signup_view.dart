import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hashbird/common/common.dart';
import 'package:hashbird/constants/constants.dart';
import 'package:hashbird/features/auth/controller/auth_controller.dart';
import 'package:hashbird/features/auth/view/login_view.dart';
import 'package:hashbird/features/auth/widgets/auth_field.dart';
import 'package:hashbird/theme/theme.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const SignUpView(),
  );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  child: const Center(
                    child: Text('Sign Up',style: TextStyle(fontSize: 50,color: Colors.white,fontStyle: FontStyle.italic,),),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                // textfield 1
                AuthField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 25),
                AuthField(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                    onTap: onSignUp,
                    label: 'Done',
                  ),
                ),
                const SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: ' Login',
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          //TODO: i made some changes here
                            Navigator.pushReplacement(
                              context,
                              LoginView.route(),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}