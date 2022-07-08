import 'package:argaam_task/src/app.dart';
import 'package:argaam_task/src/core/components/components.dart';
import 'package:argaam_task/src/views/screens/bottom_nav_bar.dart';
import 'package:argaam_task/src/views/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var EmailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/3d/argaam.png'),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Sign in To Your Account',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    controller: EmailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                      return null;
                    },
                    label: 'Email',
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    lines: 1,
                    isPassword: true,
                    type: TextInputType.visiblePassword,
                    validate: (String? value) {
                      if (value!.isEmpty) return 'Password is Too Short';
                      return null;
                    },
                    onSubmit: (value) {},
                    label: 'Password',
                    prefix: Icons.lock_outline,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                    function: () {
                      NavigateAndFinish(context, BottomNavBar());
                    },
                    text: 'Sign In',
                    radius: 12.0,
                    isUpperCase: true,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have An Account?'),
                      defaultTextButton(
                          function: () {
                            NavigateTo(context, RegisterScreen());
                          },
                          text: 'Sign Up')
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
