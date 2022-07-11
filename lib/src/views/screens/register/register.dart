// ignore_for_file: avoid_print, must_be_immutable

import 'package:argaam_task/src/core/components/components.dart';
import 'package:argaam_task/src/views/screens/login/login.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var formKey2 = GlobalKey<FormState>();
  String? compare;

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey2,
              child: Column(
                children: [
                  Image.asset(
                    'assets/3d/argaam.png',
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Sign up To Your Account',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter your Name';
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: Icons.person,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
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
                    type: TextInputType.visiblePassword,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'password is empty';
                      }
                      if (value.length < 7) {
                        return 'password is too short';
                      }
                      compare = value;
                      return null;
                    },
                    isPassword: true,
                    label: 'Password',
                    lines: 1,
                    prefix: Icons.lock_outline,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                    function: () {
                      NavigateAndFinish(context, const LoginScreen());
                      showToast(
                          message: 'Account Created',
                          toastStates: ToastStates.SUCCESS);
                    },
                    text: 'Sign Up',
                    isUpperCase: true,
                    radius: 12.0,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have An Account?'),
                      defaultTextButton(
                          function: () {
                            NavigateTo(context, const LoginScreen());
                          },
                          text: 'Sign in')
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
