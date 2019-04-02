import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:dio/dio.dart';
import 'data/contaminated.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:easy_alert/easy_alert.dart';

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
  AMapLocation _loc;

  void _checkPersmission() async {
    bool hasPermission =
    await SimplePermissions.checkPermission(Permission.WhenInUseLocation);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult =
      await SimplePermissions.requestPermission(
          Permission.WhenInUseLocation);
      if (requestPermissionResult != PermissionStatus.authorized) {
        Alert.alert(context, title: "申请定位权限失败");
        return;
      }
    }
    AMapLocation loc = await AMapLocationClient.getLocation(true);
    setState(() {
      _loc = loc;
    });
  }

  void initState() {
    super.initState();
    AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    _checkPersmission();
  }

  @override
  void dispose() {
    //注意这里停止监听
    AMapLocationClient.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          _checkPersmission();
        },
        child: Text(""),
        color: Colors.pinkAccent,
      ),
    );
  }
}

List<Value> one;

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

