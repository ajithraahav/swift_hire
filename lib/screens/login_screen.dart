import 'package:flutter/material.dart';
import 'package:swift_hire/widgets/custom_button.dart';
import 'package:swift_hire/widgets/custom_text.dart';
import 'package:swift_hire/widgets/widget_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  bool isPwdVisible = true;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Welcome to SwiftHire,',
                fontSize: 16,
                fontWeight: FontWeight.w300,
                textColor: Colors.grey,
              ),
              const CustomText(
                text: 'Login to your account',
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              _emailField(''),
              SizedBox(
                height: size.height * 0.02,
              ),
              _passwordTextField(),
              SizedBox(
                height: size.height * 0.07,
              ),
              GradientButton(
                text: 'Login',
                width: size.width * 0.5,
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

   Widget _emailField(String name) {
    return TextFormField(
      initialValue: name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.black,
      maxLines: 1,
      enableSuggestions: true,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontSize: 12),
      onChanged: (value) => setState(() {
        _email = value;
      }),
      decoration: WidgetFunctions().textFormFieldDecoration(
        'Email',
        prefixIcon: const Icon(Icons.mail_outline_rounded),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an email';
        }
        RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegExp.hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPwdVisible,
      cursorColor: Colors.white,
      style: const TextStyle(fontSize: 12),
      decoration: WidgetFunctions().textFormFieldDecoration(
        'Enter your password',
        prefixIcon: const Icon(Icons.lock_open_rounded),
        suffixIcon: IconButton(
          onPressed: () => setState(
            () => isPwdVisible = !isPwdVisible,
          ),
          icon: Icon(
            isPwdVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF6B50F6),
          ),
          iconSize: 16,
        ),
      ),
      onChanged: (password) {
        setState(() {
          if (password.length >= 8) {
            _password = password;
          }
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        } else if (!RegExp(
                r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
            .hasMatch(value)) {
          return 'Password is too weak\n(must contain atleast 1 number, special character,\n Uppercase, Lowercase. eg: "P@ssw0rd!")';
        }
        return null;
      },
    );
  }
}