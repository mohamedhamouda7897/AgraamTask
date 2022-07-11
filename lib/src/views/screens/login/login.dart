// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:argaam_task/src/core/components/components.dart';
import 'package:argaam_task/src/views/screens/bottom_nav_bar.dart';
import 'package:argaam_task/src/views/screens/login/notification.dart';
import 'package:argaam_task/src/views/screens/register/register.dart';
import 'package:flutter/material.dart';

import 'package:timezone/data/latest.dart' as tz;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  var EmailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

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
                      // notifiction calling
                      NotificationApi().showNotification(1, "Agraam",
                          "Haay ! Welcome in argaam app thank you ", 10);
                      // NotificationApi.showNotification(
                      //     title: 'Agraam',
                      //     body: 'Haay ! Welcome in argaam app thank you ',
                      //     payload: 'agraam.com');
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
