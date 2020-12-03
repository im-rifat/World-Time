import 'package:flutter/material.dart';
import 'package:world_time/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(flag: '', url: 'Asia/Bangkok', location: 'Bangkok'),
    WorldTime(flag: '', url: 'Asia/Dhaka', location: 'Dhaka'),
    WorldTime(flag: '', url: 'Asia/Kabul', location: 'Kabul')
  ];

  void updateTime(int index) async {
    WorldTime instance = WorldTime(url: locations[index].url, location: locations[index].location, flag: locations[index].flag);
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
      'flag': instance.flag
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              updateTime(index);
            },
            title: Text(locations[index].location),
          ),
        );
      },
      itemCount: locations.length,),
    );
  }
}
