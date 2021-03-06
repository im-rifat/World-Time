import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String img = data['isDayTime'] ? 'day.jpg' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue[600]: Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$img'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        'time': result['time'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                        'location': result['location']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location,
                  color: Colors.white,),
                  label: Text('choose location',
                  style: TextStyle(
                    color: Colors.white
                  ),)),
              SizedBox(
                height: 28.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 28.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.white),
              )
            ],
        ),
      ),
          )),
    );
  }
}
