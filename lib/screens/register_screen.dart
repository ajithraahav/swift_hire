import 'package:flutter/material.dart';
import 'package:swift_hire/screens/home_screen.dart';
import 'package:swift_hire/screens/login_screen.dart';
import 'package:swift_hire/widgets/custom_button.dart';
import 'package:swift_hire/widgets/custom_text.dart';
import 'package:swift_hire/widgets/widget_functions.dart';

class ResgisterScreen extends StatefulWidget {
  const ResgisterScreen({super.key});

  @override
  State<ResgisterScreen> createState() => _ResgisterScreenState();
}

class _ResgisterScreenState extends State<ResgisterScreen> {
  String _userName = '';
  String _email = '';
  bool isPwdVisible = true;
  bool isCPwdVisible = true;
  String _name = '';
  String _password = '';
  String _confirmPassword = '';

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
                text: 'Create an account',
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              _nameField(''),
              SizedBox(
                height: size.height * 0.02,
              ),
              _emailField(''),
              SizedBox(
                height: size.height * 0.02,
              ),
              _passwordTextField(),
              SizedBox(
                height: size.height * 0.02,
              ),
              _confirmPasswordTextField(),
              SizedBox(
                height: size.height * 0.07,
              ),
              GradientButton(
                text: 'Register',
                width: size.width * 0.5,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameField(String name) {
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
        _userName = value;
      }),
      decoration: WidgetFunctions().textFormFieldDecoration(
        'Full Name',
        prefixIcon: const Icon(Icons.person_3_outlined),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your name';
        }
        RegExp textRegExp = RegExp(r'^[a-zA-Z ]*$');
        if (!textRegExp.hasMatch(value)) {
          return 'Please enter a valid name';
        }
        return null;
      },
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
        prefixIcon: Icon(Icons.lock_open_rounded),
        suffixIcon: IconButton(
          onPressed: () => setState(
            () => isPwdVisible = !isPwdVisible,
          ),
          icon: Icon(
            isPwdVisible ? Icons.visibility : Icons.visibility_off,
            color: Color(0xFF6B50F6),
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

  Widget _confirmPasswordTextField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      cursorColor: Colors.white,
      style: const TextStyle(fontSize: 12),
      decoration: WidgetFunctions().textFormFieldDecoration(
        'Re-Enter to confirm password',
        prefixIcon: Icon(Icons.lock_open_rounded),
        suffixIcon: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () => setState(
            () => isCPwdVisible = !isCPwdVisible,
          ),
          icon: Icon(
            isCPwdVisible ? Icons.visibility : Icons.visibility_off,
            color: Color(0xFF6B50F6),
          ),
        ),
      ),
      onChanged: (password) {
        setState(() {
          if (password.length >= 8) {
            _confirmPassword = password;
          }
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password !';
        } else if (value != _password) {
          return "Password doesn't match !";
        }
        return null;
      },
    );
  }
}
