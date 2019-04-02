import 'dart:convert' show json;

class Contaminated {

  String code;
  String message;
  String redirect;
  List<Value> value;

  Contaminated.fromParams({this.code, this.message, this.redirect, this.value});

  factory Contaminated(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Contaminated.fromJson(json.decode(jsonStr)) : new Contaminated.fromJson(jsonStr);

  Contaminated.fromJson(jsonRes) {
    code = jsonRes['code'];
    message = jsonRes['message'];
    redirect = jsonRes['redirect'];
    value = jsonRes['value'] == null ? null : [];

    for (var valueItem in value == null ? [] : jsonRes['value']){
      value.add(valueItem == null ? null : new Value.fromJson(valueItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null?'${json.encode(code)}':'null'},"message": ${message != null?'${json.encode(message)}':'null'},"redirect": ${redirect != null?'${json.encode(redirect)}':'null'},"value": $value}';
  }
}

class Value {

  int cityid;
  String city;
  String provinceName;
  List<Alarms> alarms;
  List<Indexes> indexes;
  List<Weathers> weathers;
  Pm25 pm25;
  Realtime realtime;
  WeatherDetailsInfo weatherDetailsInfo;

  Value.fromParams({this.cityid, this.city, this.provinceName, this.alarms, this.indexes, this.weathers, this.pm25, this.realtime, this.weatherDetailsInfo});

  Value.fromJson(jsonRes) {
    cityid = jsonRes['cityid'];
    city = jsonRes['city'];
    provinceName = jsonRes['provinceName'];
    alarms = jsonRes['alarms'] == null ? null : [];

    for (var alarmsItem in alarms == null ? [] : jsonRes['alarms']){
      alarms.add(alarmsItem == null ? null : new Alarms.fromJson(alarmsItem));
    }

    indexes = jsonRes['indexes'] == null ? null : [];

    for (var indexesItem in indexes == null ? [] : jsonRes['indexes']){
      indexes.add(indexesItem == null ? null : new Indexes.fromJson(indexesItem));
    }

    weathers = jsonRes['weathers'] == null ? null : [];

    for (var weathersItem in weathers == null ? [] : jsonRes['weathers']){
      weathers.add(weathersItem == null ? null : new Weathers.fromJson(weathersItem));
    }

    pm25 = jsonRes['pm25'] == null ? null : new Pm25.fromJson(jsonRes['pm25']);
    realtime = jsonRes['realtime'] == null ? null : new Realtime.fromJson(jsonRes['realtime']);
    weatherDetailsInfo = jsonRes['weatherDetailsInfo'] == null ? null : new WeatherDetailsInfo.fromJson(jsonRes['weatherDetailsInfo']);
  }

  @override
  String toString() {
    return '{"cityid": ${city != null?'${json.encode(city)}':'null'}id,"city": ${city != null?'${json.encode(city)}':'null'},"provinceName": ${provinceName != null?'${json.encode(provinceName)}':'null'},"alarms": $alarms,"indexes": $indexes,"weathers": $weathers,"pm25": $pm25,"realtime": $realtime,"weatherDetailsInfo": $weatherDetailsInfo}';
  }
}

class WeatherDetailsInfo {

  String publishTime;
  List<Weather3HoursDetailsInfos> weather3HoursDetailsInfos;

  WeatherDetailsInfo.fromParams({this.publishTime, this.weather3HoursDetailsInfos});

  WeatherDetailsInfo.fromJson(jsonRes) {
    publishTime = jsonRes['publishTime'];
    weather3HoursDetailsInfos = jsonRes['weather3HoursDetailsInfos'] == null ? null : [];

    for (var weather3HoursDetailsInfosItem in weather3HoursDetailsInfos == null ? [] : jsonRes['weather3HoursDetailsInfos']){
      weather3HoursDetailsInfos.add(weather3HoursDetailsInfosItem == null ? null : new Weather3HoursDetailsInfos.fromJson(weather3HoursDetailsInfosItem));
    }
  }

  @override
  String toString() {
    return '{"publishTime": ${publishTime != null?'${json.encode(publishTime)}':'null'},"weather3HoursDetailsInfos": $weather3HoursDetailsInfos}';
  }
}

class Weather3HoursDetailsInfos {

  String endTime;
  String highestTemperature;
  String img;
  String isRainFall;
  String lowerestTemperature;
  String precipitation;
  String startTime;
  String wd;
  String weather;
  String ws;

  Weather3HoursDetailsInfos.fromParams({this.endTime, this.highestTemperature, this.img, this.isRainFall, this.lowerestTemperature, this.precipitation, this.startTime, this.wd, this.weather, this.ws});

  Weather3HoursDetailsInfos.fromJson(jsonRes) {
    endTime = jsonRes['endTime'];
    highestTemperature = jsonRes['highestTemperature'];
    img = jsonRes['img'];
    isRainFall = jsonRes['isRainFall'];
    lowerestTemperature = jsonRes['lowerestTemperature'];
    precipitation = jsonRes['precipitation'];
    startTime = jsonRes['startTime'];
    wd = jsonRes['wd'];
    weather = jsonRes['weather'];
    ws = jsonRes['ws'];
  }

  @override
  String toString() {
    return '{"endTime": ${endTime != null?'${json.encode(endTime)}':'null'},"highestTemperature": ${highestTemperature != null?'${json.encode(highestTemperature)}':'null'},"img": ${img != null?'${json.encode(img)}':'null'},"isRainFall": ${isRainFall != null?'${json.encode(isRainFall)}':'null'},"lowerestTemperature": ${lowerestTemperature != null?'${json.encode(lowerestTemperature)}':'null'},"precipitation": ${precipitation != null?'${json.encode(precipitation)}':'null'},"startTime": ${startTime != null?'${json.encode(startTime)}':'null'},"wd": ${wd != null?'${json.encode(wd)}':'null'},"weather": ${weather != null?'${json.encode(weather)}':'null'},"ws": ${ws != null?'${json.encode(ws)}':'null'}}';
  }
}

class Realtime {

  String img;
  String sD;
  String sendibleTemp;
  String temp;
  String time;
  String wD;
  String wS;
  String weather;
  String ziwaixian;

  Realtime.fromParams({this.img, this.sD, this.sendibleTemp, this.temp, this.time, this.wD, this.wS, this.weather, this.ziwaixian});

  Realtime.fromJson(jsonRes) {
    img = jsonRes['img'];
    sD = jsonRes['sD'];
    sendibleTemp = jsonRes['sendibleTemp'];
    temp = jsonRes['temp'];
    time = jsonRes['time'];
    wD = jsonRes['wD'];
    wS = jsonRes['wS'];
    weather = jsonRes['weather'];
    ziwaixian = jsonRes['ziwaixian'];
  }

  @override
  String toString() {
    return '{"img": ${img != null?'${json.encode(img)}':'null'},"sD": ${sD != null?'${json.encode(sD)}':'null'},"sendibleTemp": ${sendibleTemp != null?'${json.encode(sendibleTemp)}':'null'},"temp": ${temp != null?'${json.encode(temp)}':'null'},"time": ${time != null?'${json.encode(time)}':'null'},"wD": ${wD != null?'${json.encode(wD)}':'null'},"wS": ${wS != null?'${json.encode(wS)}':'null'},"weather": ${weather != null?'${json.encode(weather)}':'null'},"ziwaixian": ${ziwaixian != null?'${json.encode(ziwaixian)}':'null'}}';
  }
}

class Pm25 {

  int citycount;
  int cityrank;
  String advice;
  String aqi;
  String co;
  String color;
  String level;
  String no2;
  String o3;
  String pm10;
  String pm25;
  String quality;
  String so2;
  String timestamp;
  String upDateTime;

  Pm25.fromParams({this.citycount, this.cityrank, this.advice, this.aqi, this.co, this.color, this.level, this.no2, this.o3, this.pm10, this.pm25, this.quality, this.so2, this.timestamp, this.upDateTime});

  Pm25.fromJson(jsonRes) {
    citycount = jsonRes['citycount'];
    cityrank = jsonRes['cityrank'];
    advice = jsonRes['advice'];
    aqi = jsonRes['aqi'];
    co = jsonRes['co'];
    color = jsonRes['color'];
    level = jsonRes['level'];
    no2 = jsonRes['no2'];
    o3 = jsonRes['o3'];
    pm10 = jsonRes['pm10'];
    pm25 = jsonRes['pm25'];
    quality = jsonRes['quality'];
    so2 = jsonRes['so2'];
    timestamp = jsonRes['timestamp'];
    upDateTime = jsonRes['upDateTime'];
  }

  @override
  String toString() {
    return '{"citycount": $citycount,"cityrank": $cityrank,"advice": ${advice != null?'${json.encode(advice)}':'null'},"aqi": ${aqi != null?'${json.encode(aqi)}':'null'},"co": ${co != null?'${json.encode(co)}':'null'},"color": ${color != null?'${json.encode(color)}':'null'},"level": ${level != null?'${json.encode(level)}':'null'},"no2": ${no2 != null?'${json.encode(no2)}':'null'},"o3": ${o3 != null?'${json.encode(o3)}':'null'},"pm10": ${pm10 != null?'${json.encode(pm10)}':'null'},"pm25": ${pm25 != null?'${json.encode(pm25)}':'null'},"quality": ${quality != null?'${json.encode(quality)}':'null'},"so2": ${so2 != null?'${json.encode(so2)}':'null'},"timestamp": ${timestamp != null?'${json.encode(timestamp)}':'null'},"upDateTime": ${upDateTime != null?'${json.encode(upDateTime)}':'null'}}';
  }
}

class Weathers {

  String date;
  String img;
  String sun_down_time;
  String sun_rise_time;
  String temp_day_c;
  String temp_day_f;
  String temp_night_c;
  String temp_night_f;
  String wd;
  String weather;
  String week;
  String ws;

  Weathers.fromParams({this.date, this.img, this.sun_down_time, this.sun_rise_time, this.temp_day_c, this.temp_day_f, this.temp_night_c, this.temp_night_f, this.wd, this.weather, this.week, this.ws});

  Weathers.fromJson(jsonRes) {
    date = jsonRes['date'];
    img = jsonRes['img'];
    sun_down_time = jsonRes['sun_down_time'];
    sun_rise_time = jsonRes['sun_rise_time'];
    temp_day_c = jsonRes['temp_day_c'];
    temp_day_f = jsonRes['temp_day_f'];
    temp_night_c = jsonRes['temp_night_c'];
    temp_night_f = jsonRes['temp_night_f'];
    wd = jsonRes['wd'];
    weather = jsonRes['weather'];
    week = jsonRes['week'];
    ws = jsonRes['ws'];
  }

  @override
  String toString() {
    return '{"date": ${date != null?'${json.encode(date)}':'null'},"img": ${img != null?'${json.encode(img)}':'null'},"sun_down_time": ${sun_down_time != null?'${json.encode(sun_down_time)}':'null'},"sun_rise_time": ${sun_rise_time != null?'${json.encode(sun_rise_time)}':'null'},"temp_day_c": ${temp_day_c != null?'${json.encode(temp_day_c)}':'null'},"temp_day_f": ${temp_day_f != null?'${json.encode(temp_day_f)}':'null'},"temp_night_c": ${temp_night_c != null?'${json.encode(temp_night_c)}':'null'},"temp_night_f": ${temp_night_f != null?'${json.encode(temp_night_f)}':'null'},"wd": ${wd != null?'${json.encode(wd)}':'null'},"weather": ${weather != null?'${json.encode(weather)}':'null'},"week": ${week != null?'${json.encode(week)}':'null'},"ws": ${ws != null?'${json.encode(ws)}':'null'}}';
  }
}

class Indexes {

  String abbreviation;
  String alias;
  String content;
  String level;
  String name;

  Indexes.fromParams({this.abbreviation, this.alias, this.content, this.level, this.name});

  Indexes.fromJson(jsonRes) {
    abbreviation = jsonRes['abbreviation'];
    alias = jsonRes['alias'];
    content = jsonRes['content'];
    level = jsonRes['level'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"abbreviation": ${abbreviation != null?'${json.encode(abbreviation)}':'null'},"alias": ${alias != null?'${json.encode(alias)}':'null'},"content": ${content != null?'${json.encode(content)}':'null'},"level": ${level != null?'${json.encode(level)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

class Alarms {

  String alarmContent;
  String alarmDesc;
  String alarmId;
  String alarmLevelNo;
  String alarmLevelNoDesc;
  String alarmType;
  String alarmTypeDesc;
  String precaution;
  String publishTime;

  Alarms.fromParams({this.alarmContent, this.alarmDesc, this.alarmId, this.alarmLevelNo, this.alarmLevelNoDesc, this.alarmType, this.alarmTypeDesc, this.precaution, this.publishTime});

  Alarms.fromJson(jsonRes) {
    alarmContent = jsonRes['alarmContent'];
    alarmDesc = jsonRes['alarmDesc'];
    alarmId = jsonRes['alarmId'];
    alarmLevelNo = jsonRes['alarmLevelNo'];
    alarmLevelNoDesc = jsonRes['alarmLevelNoDesc'];
    alarmType = jsonRes['alarmType'];
    alarmTypeDesc = jsonRes['alarmTypeDesc'];
    precaution = jsonRes['precaution'];
    publishTime = jsonRes['publishTime'];
  }

  @override
  String toString() {
    return '{"alarmContent": ${alarmContent != null?'${json.encode(alarmContent)}':'null'},"alarmDesc": ${alarmDesc != null?'${json.encode(alarmDesc)}':'null'},"alarmId": ${alarmId != null?'${json.encode(alarmId)}':'null'},"alarmLevelNo": ${alarmLevelNo != null?'${json.encode(alarmLevelNo)}':'null'},"alarmLevelNoDesc": ${alarmLevelNoDesc != null?'${json.encode(alarmLevelNoDesc)}':'null'},"alarmType": ${alarmType != null?'${json.encode(alarmType)}':'null'},"alarmTypeDesc": ${alarmTypeDesc != null?'${json.encode(alarmTypeDesc)}':'null'},"precaution": ${precaution != null?'${json.encode(precaution)}':'null'},"publishTime": ${publishTime != null?'${json.encode(publishTime)}':'null'}}';
  }
}

