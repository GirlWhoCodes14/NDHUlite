import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // redirect to launch url if you forget password
  _launchURL() async {
    Uri url = Uri.parse('https://gms.ndhu.edu.tw/passwd/');
    if (await launchUrl(url))  {await launchUrl(url);}
    else {throw 'Could not launch $url';}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/images/LOGO_NDHU.Pure_233.png', height: 90,),
              const Text(
                "NDHUlite",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 25,),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Enter email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              const SizedBox(height: 25,),

              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),

              const SizedBox(height: 5,),

              Row(
                mainAxisAlignment:  MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: _launchURL,
                      child: const Text("Forget Password?")
                  )
                ],
              ),

              const SizedBox(height: 25,),

              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(colors: [Colors.blueGrey, Colors.green]),
                ),
                child: MaterialButton(
                  onPressed: (){},
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}