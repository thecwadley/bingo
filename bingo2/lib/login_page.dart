import 'package:bingo2/firebase/auth_service.dart';
import 'package:bingo2/bingo_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo or App Name
                const FlutterLogo(size: 100),
                const SizedBox(height: 30),

                // Title
                Text(
                  isLogin ? 'Welcome Back!' : 'Create an Account',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Form
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // Email TextField
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password TextField
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Confirm Password (only for signup)
                        if (!isLogin)
                          TextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                          ),
                        if (!isLogin) const SizedBox(height: 20),

                        // Login/Signup Button
                        ElevatedButton(
                          onPressed: () async {
                            await checkLogin(context);
                          },
                          child: Text(isLogin ? 'Login' : 'Sign Up'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Switch between Login and Signup
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? "Don't have an account? Sign Up"
                        : 'Already have an account? Login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext context) async {
    late final String? message;

    if (isLogin) {
      message = await AuthService().login(
          email: _emailController.text,
          password: _passwordController.text
      );
    } else if (_passwordController.text != _confirmPasswordController.text) {
      message = "Please ensure password confirmation matches.";
    } else {
      message = await AuthService().registration(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }

    if (message!.contains('Success') && context.mounted) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BingoPage()));
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          )
      );
    }
  }
}