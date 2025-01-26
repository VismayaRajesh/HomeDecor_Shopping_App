import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/my_app_constants.dart';
import '../../widgets/logintext_widget.dart';
import 'loginscreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isPrivacyAccepted = false; // Track checkbox state

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(), // Ensure LoginPage is implemented.
      ),
    );
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(MyAppConstants.signup),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: LoginTextWidget(
                  labelText: 'Full Name',
                  prefixIcon: Icons.person,
                  controller: _fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: LoginTextWidget(
                  labelText: 'Email ID',
                  prefixIcon: Icons.email,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email ID';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: LoginTextWidget(
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  suffixIcon: _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  onSuffixIconTap: _togglePasswordVisibility,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: LoginTextWidget(
                  labelText: 'Confirm Password',
                  prefixIcon: Icons.lock,
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  onSuffixIconTap: _toggleConfirmPasswordVisibility,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isPrivacyAccepted,
                      onChanged: (value) {
                        setState(() {
                          _isPrivacyAccepted = value ?? false;
                        });
                      },
                    ),
                    const Text('I accept the '),
                    GestureDetector(
                      onTap: () {},
                      child: const Text('Privacy policy',
                          style: TextStyle(color: Colors.blue)),
                    ),
                    const Text(' and '),
                    GestureDetector(
                      onTap: () {},
                      child: const Text('Terms',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isPrivacyAccepted
                      ? const Color(0xFFB39D7B)
                      : Colors.grey,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 74, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _isPrivacyAccepted
                    ? () {
                  if (_formKey.currentState!.validate()) {
                    _navigateToLogin(context);
                  }
                }
                    : null, // Disable button if checkbox not checked
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  GestureDetector(
                    onTap: () {
                      _navigateToLogin(context);
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
