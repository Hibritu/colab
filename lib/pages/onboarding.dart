import 'package:flutter/material.dart';
import 'package:news_app/pages/home.dart';
class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              "images/late.png",
              height: MediaQuery.of(context).size.height / 1.7,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 1.9,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  Text(
                    "get the latest news",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Image.asset( "images/latest news.png" ,height: 100,width: 150,fit:BoxFit.cover),
                  SizedBox(height: 30.0,),
                  Container(
                    margin: EdgeInsets.only(
                      left: 40.0,
                      right: 40.0,
                    ),
                  child: Material(
              elevation: 3.3,
              borderRadius: BorderRadius.circular(30.0),
            child: InkWell(
             borderRadius: BorderRadius.circular(30.0),
         onTap: () {
          Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => Home()),
         );
       },
       child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  child: Center(
                    child: Text(
                      "Get started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                      ),
                            ),
                  ),
                ),
              ),
            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}