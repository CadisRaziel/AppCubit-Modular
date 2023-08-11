import 'package:flutter/material.dart';
import 'package:jobtimer/app/modules/core/ui/job_timer_icons.dart';

class SplashPage extends StatelessWidget {

  const SplashPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Splash'),),
           body: Center(child: Container(
            child: Icon(JobTimerIcons.angle_double_right),
           )),
       );
  }
}