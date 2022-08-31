import 'package:flutter/material.dart';
import 'package:demoapp/LiveServices/World_Time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List <WorldTime> locations = [
    WorldTime(location: 'Australia', flag: 'australia.jpg', url:'Australia/Sydney'),
    WorldTime(location: 'Bangladesh', flag: 'bangladesh.jpg', url:'Asia/Dhaka'),
    WorldTime(location: 'China', flag: 'china.jpg', url:'Asia/Shanghai'),
    WorldTime(location: 'Egypt', flag: 'egypt.jpg', url:'Africa/Cairo'),
    WorldTime(location: 'France', flag: 'france.jpg', url:'Europe/Paris'),
    WorldTime(location: 'Germany', flag: 'germany.jpg', url:'Europe/Berlin'),
    WorldTime(location: 'Greece', flag: 'greece.jpg', url:'Europe/Athens'),
    WorldTime(location: 'Hong Kong', flag: 'hongkong.jpg', url:'Asia/Hong_Kong'),
    WorldTime(location: 'India', flag: 'india.jpg', url:'Asia/Kolkata'),
    WorldTime(location: 'Ireland', flag: 'ireland.jpg', url:'Europe/Dublin'),
    WorldTime(location: 'Japan', flag: 'japan.jpg', url:'Asia/Tokyo'),
    WorldTime(location: 'Kenya', flag: 'kenya.jpg', url:'Africa/Nairobi'),
    WorldTime(location: 'Malaysia', flag: 'malaysia.jpg', url:'Asia/Kuala_Lumpur'),
    WorldTime(location: 'Poland', flag: 'poland.jpg', url:'Europe/Warsaw'),
    WorldTime(location: 'Russia', flag: 'russia.jpg', url:'Europe/Moscow'),
    WorldTime(location: 'Singapore', flag: 'singapore.jpg', url:'Asia/Singapore'),
    WorldTime(location: 'South Korea', flag: 'southkorea.jpg', url:'Asia/Seoul'),
    WorldTime(location: 'Sri Lanka', flag: 'srilanka.jpg', url:'Asia/Colombo'),
    WorldTime(location: 'UAE', flag: 'uae.jpg', url:'Asia/Dubai'),
    WorldTime(location: 'Ukraine', flag: 'ukraine.jpg', url:'Europe/Kiev'),
    WorldTime(location: 'UK', flag: 'unitedkingdom.jpg', url:'Europe/London'),
    WorldTime(location: 'US', flag: 'unitedstates.jpg', url:'America/Chicago'),
  ];

  void UpdateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'timeSlot' : instance.timeSlot
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey[400],
              child: ListTile(
                onTap: () {
                  UpdateTime(index);
                },
                title: Text(
                    locations[index].location,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 55,
                    minHeight: 45,
                    maxWidth: 55,
                    maxHeight: 65,
                  ),
                  child: Image(
                    image: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      )
    );
  }
}
