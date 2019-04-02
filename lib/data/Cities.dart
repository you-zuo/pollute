import 'dart:convert' show json;

class Cities {

  List<Citys> cities;

  Cities.fromParams({this.cities});

  factory Cities(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Cities.fromJson(json.decode(jsonStr)) : new Cities.fromJson(jsonStr);

  Cities.fromJson(jsonRes) {
    cities = jsonRes['cities'] == null ? null : [];

    for (var citiesItem in cities == null ? [] : jsonRes['cities']){
      cities.add(citiesItem == null ? null : new Citys.fromJson(citiesItem));
    }
  }

  @override
  String toString() {
    return '{"cities": $cities}';
  }
}

class Citys {

  String city;
  String cityid;

  Citys.fromParams({this.city, this.cityid});

  Citys.fromJson(jsonRes) {
    city = jsonRes['city'];
    cityid = jsonRes['cityid'];
  }

  @override
  String toString() {
    return '{"city": ${city != null?'${json.encode(city)}':'null'},"cityid": ${cityid != null?'${json.encode(cityid)}':'null'}}';
  }
}

