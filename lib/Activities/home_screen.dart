import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Map to hold the values of the time, location, flag
  Map timeData = {};
  @override
  Widget build(BuildContext context) {

    //Ternary operator to check if the timedata map is not empty. If not empty, then data was returned from the choose location
    //screen, so that data should not be overwritten. If is empty that use initial data to set the state.

    timeData = timeData.isNotEmpty ? timeData: ModalRoute.of(context).settings.arguments;
    print(timeData);

    //set the background image based on the time of the day
    String backgroundImage = timeData['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color statusBarColor = timeData['isDaytime'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: statusBarColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/$backgroundImage'
              ),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0.0, 0),
            child: Column(
              children: <Widget> [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      //updating the time timedata map with the data returned from the choose location screen
                      timeData = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDaytime' : result['isDaytime'],
                        'flag' : result['flag']
                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                      color:  Colors.grey[300],
                  ),
                  label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300]
                      ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      timeData['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ) ,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                timeData['time'],
                style: TextStyle(
                    fontSize: 70,
                    color: Colors.white
                ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
