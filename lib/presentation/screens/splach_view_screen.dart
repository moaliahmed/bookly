import 'package:bookly/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../component/rounded_button.dart';

class SplashViewScreen extends StatelessWidget {
  const SplashViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/image/Bitmap.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.displayMedium,
                children: const [
                  TextSpan(
                    text: 'flamin',
                  ),
                  TextSpan(
                    text: 'go.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: 'Start reading',
                press: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen(),)) ,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



