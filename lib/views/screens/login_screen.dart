import 'package:flutter/material.dart';
import 'package:mytiktok/views/screens/signup_screen.dart';
import 'package:mytiktok/views/widgets/texts.dart';

import '../../constants.dart';
import '../widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titletext,
            mymaxvertical_space,
           logintext,
            SizedBox(height: size.height*.05,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
            SizedBox(height: size.height*.035,),
            Container(
              width:size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            SizedBox(height: size.height*.04,),
            Container(
              width:size.width - 40,
              height: size.height*.062,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: InkWell(
                onTap: () => authController.loginUser(
                  _emailController.text,
                  _passwordController.text,
                ),
                child: Center(child: loginbuttontext),
              ),
            ),
            mymaxvertical_space,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                nothaveaccount_text,
                InkWell(
                    onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        ),
                    child: registertext),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
