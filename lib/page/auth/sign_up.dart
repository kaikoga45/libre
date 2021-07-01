import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:libre/domain/auth_helper.dart';
import 'package:libre/main.dart';

class SignUp extends StatefulWidget {
  static const id = '/sign_up';

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _accentColor = Theme.of(context).accentColor;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: _accentColor,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/sign_up.svg',
              fit: BoxFit.fitHeight,
            ),
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(bottom: 25, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign Up',
                    style: _textTheme.headline4!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Please fill the below form in order to created your account',
                    style: _textTheme.bodyText1,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            isDense: true,
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: _accentColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: _accentColor,
                              ),
                            ),
                          ),
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter your email';
                            } else if (_errorMessage == "invalid-email") {
                              return "Please enter a valid email address";
                            } else if (_errorMessage == "user-not-found") {
                              return "Sorry, We couldn't find your account";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            isDense: true,
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: _accentColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: _accentColor,
                              ),
                            ),
                          ),
                          validator: (pass) {
                            if (pass == null || pass.isEmpty) {
                              return 'Please enter your password';
                            } else if (_errorMessage == "wrong-password") {
                              return "Password you entered is incorrect";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 50),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = !_isLoading;
                        });

                        final Map<String, dynamic> output = await AuthHelper(
                          email: this._emailController.text,
                          pass: this._passwordController.text,
                        ).signUp();

                        setState(() {
                          _isLoading = !_isLoading;
                        });
                        if (output["valid"] == true) {
                          navigatorKey.currentState!.pop();
                        } else {
                          _errorMessage = output["message"];
                          _formKey.currentState!.validate();
                        }
                      }
                    },
                    child: Text(
                      'SUBMIT',
                      style: _textTheme.button,
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
