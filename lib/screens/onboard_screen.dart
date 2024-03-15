import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swift_hire/screens/register_screen.dart';
import 'package:swift_hire/widgets/custom_button.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
            children: [
              SvgPicture.asset('assets/images/app_logo.svg'),
              SizedBox(
                height: size.height * 0.15,
              ),
              GradientButton(
                text: 'Register',
                width: size.width * 0.5,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResgisterScreen(),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              GradientButton(
                text: 'Login',
                width: size.width * 0.5,
                onPressed: () {
                  // Add your button click logic here
                  print('Button Clicked!');
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
