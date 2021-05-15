import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yachap/app/ui/home/home.dart';
import 'package:yachap/app/utils/resources.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    toHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Resources.splash),
              fit: BoxFit.fill,
            ),
          ),
         /* child: Stack(
            children: [
              SizedBox(height: 20,),


                Container(
                    width: 222,
                    height: 65,

                    child: Image.asset(Resources.pension65),
                  ),

              SizedBox(height: 60,),


                Container(
                    width: 200,
                    //height: 65,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Image.asset(Resources.midis),
                  ),

              SizedBox(height: 20,),

              Container(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Image.asset(Resources.bicentenario),
                  )
               ,


            ],
          )*/
      ),
    );
  }

  void toHome() {
    Timer.periodic(Duration(seconds: 3), (time) async {
      Navigator.pushAndRemoveUntil(context, HomePage.route(), (route) => false);
      time.cancel();
    });
  }
}
