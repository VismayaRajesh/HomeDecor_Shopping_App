import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/model/Data_Model/productData.dart';
import 'package:homedecor_shopping_app/view/screen/signup.dart';
import 'package:homedecor_shopping_app/widgets/sociallogin_widget.dart';

import '../../widgets/logintext_widget.dart';
import 'bottomnav_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GoogleSignIn _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

    Future<GoogleSignInAccount?> signIn() async {
      try{
        final GoogleSignInAccount? user = await _googleSignIn.signIn();
        if(user!=null){
          setState(() {
            _user = user;
          });

          // Navigate to HomeScreen with the user's name
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomnavScreen(userName: user.displayName ?? "User"),
            ),
          );
        }
      }
      catch(e){
        print(e);
      }
    }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  User? _emuser;

  void _navigateToHomePage() {
    if (_formKey.currentState!.validate()) {
      String? emuserName = _emuser?.displayName ?? "User";
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomnavScreen(userName: emuserName)));
    }
  }

  Future<void> signInWithEmailPassword() async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      setState(() {
        _emuser = userCredential.user;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged in successfully as ${_emuser?.email}'),
          duration: Duration(seconds: 3),
        ),
      );

      _navigateToHomePage();
    } catch (e) {
      print('Error during sign-in: $e');
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _navigateToSignUpPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: CurvedClipper(),
                child: Container(
                  height: 265,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(MyAppConstants.login),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 105.0),
                child: const Text(
                  'Enter your Email and Password',
                  style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              // Email Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: LoginTextWidget(
                  controller: _emailController,
                  labelText: 'Email ID',
                  prefixIcon: MyAppIcon.profilecircle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 18),
              // Password Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: LoginTextWidget(
                  controller: _passwordController,
                  labelText: 'Password',
                  prefixIcon: MyAppIcon.lock,
                  suffixIcon: _obscurePassword ? MyAppIcon.passordclose : MyAppIcon.passwordshow,
                  obscureText: _obscurePassword,
                  onSuffixIconTap: _togglePasswordVisibility,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, top: 10),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB39D7B),
                  padding: const EdgeInsets.symmetric(horizontal: 74, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  await signInWithEmailPassword();
                  _navigateToHomePage();
                },
                child: const Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Or Connect using',
                style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 25),
              // Social Media Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginWidget(
                    imageUrl: MyAppConstants.facebook,
                  ),
                  const SizedBox(width: 24),
                  InkWell(
                    onTap: () async {
                      await signIn();
                    },
                    child: SocialLoginWidget(
                      imageUrl: MyAppConstants.google,
                    ),
                  ),
                  const SizedBox(width: 24),
                  SocialLoginWidget(imageUrl: MyAppConstants.apple),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: _navigateToSignUpPage,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,)
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}