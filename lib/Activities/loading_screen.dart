import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setUpWorldTime() async{
    WorldTime timeInstance = WorldTime(location:'Lagos', flag:'nigeria.png', url: 'Africa/Lagos');
    await timeInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': timeInstance.location,
      'flag': timeInstance.flag,
      'time': timeInstance.time,
      'isDaytime' : timeInstance.isDaytime,
    });

  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitPouringHourglass(
            color: Colors.white,
            size: 50.0,
          )
      ),
    );
  }
}
