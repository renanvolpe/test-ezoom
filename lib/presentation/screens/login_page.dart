import 'package:coolmovies/core/colors_app.dart';
import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/buttons_rounded.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  var emailController = TextEditingController(text: "joao@joao.com");
  var passwordController = TextEditingController(text: "1234");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(

            // image: DecorationImage(
            //   image: AssetImage('assets/images/background_image.jpg'),
            //   fit: BoxFit.cover, // Adjust as per your need
            // ),
            ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Image.asset(
                  //   width: 200,
                  //   "assets/images/logo-no-background.png",
                  // ),
                  const SizedBox(width: 200, height: 200, child: FlutterLogo()),
                  20.sizeH,
                  Text(
                    'It´s a app of your movies',
                    textAlign: TextAlign.center,
                    style: Style.defaultTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  // 150.sizeH,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      35.sizeH,
                      TextFormField(
                        controller: emailController,
                        readOnly: true,
                        decoration: textfieldDecorationDefault(hintText: "Email", prefixIcon: Icons.email_outlined),
                        cursorColor: Colors.grey,
                      ),
                      25.sizeH,
                      TextFormField(
                        controller: passwordController,
                        readOnly: true,
                        decoration:
                            textfieldDecorationDefault(hintText: "Password", prefixIcon: Icons.lock_outline_rounded),
                        cursorColor: Colors.grey,
                      ),
                      25.sizeH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Forgot Password',
                            style: Style.defaultLightTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      25.sizeH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ButtonBorderPrimary(
                                  onTap: () {
                                    context.pushNamed("categories");
                                  },
                                  text: "Sign in"))
                        ],
                      ),
                      25.sizeH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                                onTap: () {
                                  // flushbarNotImplementedYet(context);
                                  // // context.push("/register");
                                },
                                child: RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                    style: Style.defaultTextStyle.copyWith(fontSize: 14),
                                    children: <TextSpan>[
                                      const TextSpan(text: 'Didn´t have any account? '),
                                      TextSpan(
                                        text: ' Sign Up here',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          color: ColorsApp.kPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        ],
                      )
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
