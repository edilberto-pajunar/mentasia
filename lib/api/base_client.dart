import 'package:http/http.dart' as http;

const String baseUrl = "https://jsonplaceholder.typicode.com/posts";

class BaseClient {
  var client = http.Client();

  // GET
  Future<dynamic> get(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw an exception and catch it in UI
    }
  }
}
