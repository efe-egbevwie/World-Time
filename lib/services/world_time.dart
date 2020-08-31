import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String flag;// url to a flag icon asset
  String url;//url to the api endpoint
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});



   Future <void> getTime() async {

     try{
        //make a request to the World Time API
       Response response = await get("http://worldtimeapi.org/api/timezone/$url");
       Map data = jsonDecode(response.body);

       //get the time and offset from the request response,the datetime and offset add up to the current time
       String dateTime = data['datetime'];
       String offSet = data['utc_offset'].substring(1,3);

       DateTime now = DateTime.parse(dateTime);
       now = now.add(Duration(hours: int.parse(offSet)));

       //ternary operator to check if the time is dat or night
       isDaytime = now.hour > 6 && now.hour < 19 ? true : false;

       //here the time set to the property
       time = DateFormat.jm().format(now);
     }

     catch(e) {
       time = 'could not retrieve time data';
     }


  }


}