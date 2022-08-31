import 'package:flutter/material.dart';
import 'package:demoapp/LiveServices/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void SetUpData() async {
    WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'timeSlot' : instance.timeSlot
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SetUpData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 75,
        )
      ),
      backgroundColor: Colors.blue[900],
    );
  }
}
