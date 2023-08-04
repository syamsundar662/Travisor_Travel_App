//============For updation==============
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  final String _apiKey;

  LocationService(this._apiKey);

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$_apiKey';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    print(json['candidates']);
    if (json['candidates'] == null || json['candidates'].isEmpty) {
      throw Exception('No place ID found for the given input.');
    }
    var placeId = json['candidates'][0]['place_id'] as String;
    print(placeId);
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    print(placeId);

    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_apiKey';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;

    print(results);
    return results;
  }
}
