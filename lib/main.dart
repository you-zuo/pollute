import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:dio/dio.dart';
import 'data/contaminated.dart';

void main() {
  AMapLocationClient.setApiKey("135fbf948462805a522c058a4fd9478e");
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomeScreen();
  }
}

class _HomeScreen extends StatefulWidget {
  @override
  __HomeScreenState createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen> {
   var latitude;
   var longitude;

  void initState(){
    super.initState();
    AMapLocationClient.onLocationUpate.listen((AMapLocation loc){
      if(!mounted)return;
      setState(() {
        latitude=loc.latitude;
        longitude=loc.longitude;
      });
    });
    AMapLocationClient.startLocation();
  }
   @override
   void dispose() {
     //注意这里停止监听
     AMapLocationClient.stopLocation();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          getLocation();
        },
        child: Text(""),
        color: Colors.pinkAccent,
      ),
    );
  }
}

List<Value> one;

//卡片轮播接口
getHttp() async {
  final response = await Dio()
      .get("http://aider.meizu.com/app/weather/listWeather?cityIds=101240101");
  if (response.statusCode == 200) {
    Contaminated contaminated = Contaminated.fromJson(response.data);
    one = contaminated.value.map((item) {
      return item;
    }).toList();
  } else {
    throw ("出错了");
  }
}

setMap() async {
  await AMapLocationClient.startup(new AMapLocationOption(
      desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
}

getLocation() async{
  await AMapLocationClient.getLocation(true);
}