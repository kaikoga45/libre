import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:libre/page/auth/sign_in.dart';
import 'package:libre/page/auth/sign_up.dart';

class Onboarding extends StatelessWidget {
  static const id = '/onboarding';
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/reading.svg',
              fit: BoxFit.fitHeight,
            ),
            flex: 1,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(bottom: 25, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome To Libre!',
                    style: textTheme.headline4!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'A place where you can easily see and choose the book you want to borrow!',
                    style: textTheme.bodyText1,
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.id);
                    },
                    child: Text(
                      'SIGN UP',
                      style: textTheme.button,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignIn.id);
                    },
                    child: Text(
                      'Already have an account? Sign In',
                      style: textTheme.subtitle2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
