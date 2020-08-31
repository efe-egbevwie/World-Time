import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: 'ghana.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'south-africa.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'united-states.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'united-states.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'united-states.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong-Kong', flag: 'hong-kong.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'china.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'australia.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Europe/Copenhagen', location: 'Copenhagen', flag: 'denmark.png'),
    WorldTime(url: 'Europe/Lisbon', location: 'Lisbon', flag: 'portugal.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png'),
    WorldTime(url: 'Europe/Monaco', location: 'Monaco', flag: 'france.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.png'),
  ];

  //this function updates the time when user selects a location
  void updateTime (index) async{
    //get an instance of The world time object inside the worldtime List
    WorldTime updatedTime = locations[index];
    await updatedTime.getTime();
    //after getting the time for the selected location navigate back to the home screen
    Navigator.pop(context, {
      'location': updatedTime.location,
      'flag': updatedTime.flag,
      'time': updatedTime.time,
      'isDaytime' : updatedTime.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
      ),
     body: ListView.builder(
       itemCount: locations.length,
       itemBuilder: (context, index) {
         return Padding(
           padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0 ),
           child: Card(
             child: ListTile(
               onTap: () {
                updateTime(index);
               },
               title: Text(locations[index].location),
               leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
               ),
             ),
           ),
         );

       },
     ),
    );
  }
}

