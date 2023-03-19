import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ndhulite/components/my_button.dart';
import 'package:ndhulite/components/my_textfield.dart';
import 'package:ndhulite/components/square_tile.dart';



class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // redirect to launch url if you forget password
  _launchURL() async {
    Uri url = Uri.parse('https://gms.ndhu.edu.tw/passwd/');
    if (await launchUrl(url))  {await launchUrl(url);}
    else {throw 'Could not launch $url';}
  }

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // NDHU logo
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // NDHU Logo
                  SquareTile(imagePath: 'lib/images/LOGO_NDHU.Pure_233.png'),

                  /*SizedBox(height: 5),

                  // NDHU Chinese Name
                  SquareTile(imagePath: 'lib/images/NAME_NDHU_TW.png')*/
                ],
              ),



              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Welcome to NDHUlite!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // email textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      InkWell(
                          onTap: _launchURL,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}