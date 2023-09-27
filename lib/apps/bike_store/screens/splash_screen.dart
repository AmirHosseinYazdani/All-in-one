import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xff171b27),
            image: DecorationImage(
              image: AssetImage('assets/images/splash_screen.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              GestureDetector(
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/icons/round_btn.png'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'home');
                },
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xffff782d),
                  child: Text(
                    'Tap',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
