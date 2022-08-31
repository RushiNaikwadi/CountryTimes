import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // Location name on UI
  late String time;     // Time in that region
  late String flag;     // URL of flag
  late String url;      // Location url for API endpoint
  late String timeSlot;    // To show background image

  WorldTime ({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {

    try{
      // Make a request for WORLD TIME API
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      // Store String format data into Map format => jsonDeconde
      Map data = jsonDecode(response.body);

      // Extracting DateTime from Map data
      String dateTime = data['utc_datetime'];

      // Extracting HourOffSet from Map data
      String HourOffSet = data['utc_offset'].substring(1,3);

      // Extracting MinOffSet from Map data
      String MinOffSet = data['utc_offset'].substring(4);

      // Create a DateTime object to extract datatime from String format
      DateTime now = DateTime.parse(dateTime);

      // Adding offsets to the Time
      now = now.add(Duration(hours: int.parse(HourOffSet), minutes: int.parse(MinOffSet)));

      if (now.hour >= 5 && now.hour < 12) {
        timeSlot = '1';
      } else if (now.hour >= 12 && now.hour < 16) {
        timeSlot = '2';
      } else if (now.hour >= 16 && now.hour < 20) {
        timeSlot = '3';
      } else {
        timeSlot = '4';
      }

      // Extrating DateTime format data into String format
      time = DateFormat.jm().format(now);
    } catch(err) {
      print('ERROR COUGHT $err');
      time = "unable to get a time";
    }
  }
}