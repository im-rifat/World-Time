import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String time;
  String url;
  String location;
  String flag;
  bool isDayTime;

  WorldTime({this.url, this.location, this.flag}) {}

  Future<void> getTime() async {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime).add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour >= 6 && now.hour <= 18;

      time = DateFormat.jm().format(now);

      print(datetime);
      print(offset);
    } catch(e) {
      print("caught error $e");
      time = "time could not load";
      isDayTime = true;
    }
  }
}