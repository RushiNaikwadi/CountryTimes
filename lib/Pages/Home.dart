import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    try {
      // Catching the arguments which are sent from other file in a map
      if (data.isEmpty) {
        data = ModalRoute.of(context)!.settings.arguments as Map;
      }
    } catch (err) {
      data = data;
    }

    // Set background Image
    late String bgImage;
    if (data['timeSlot'] == '1') {
      bgImage = 'slot1.jpg';
    } else if (data['timeSlot'] == '2') {
      bgImage = 'slot2.jpg';
    } else if (data['timeSlot'] == '3') {
      bgImage = 'slot3.jpg';
    } else {
      bgImage = 'slot4.jpeg';
    }

    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 25,
                      minHeight: 25,
                      maxWidth: 30,
                      maxHeight: 30,
                    ),
                    child: Image(
                      image: AssetImage('assets/${data['flag'].split('.')[0]}.jpg'),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () async {
            dynamic result = await Navigator.pushNamed(context, '/location');
            setState(() {
              data = {
                'location' : result['location'],
                'flag' : result['flag'],
                'time': result['time'],
                'timeSlot' : result['timeSlot']
              };
            });
          },
          child: const Icon(
              Icons.location_on,
              color: Colors.yellow,
          ),
          backgroundColor: Colors.blue[900],
        ),
    );
  }
}