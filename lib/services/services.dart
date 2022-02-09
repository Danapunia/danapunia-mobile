import 'package:danapunia_mobile/config/config.dart';
import 'package:danapunia_mobile/models/_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<PuniaCategoryData?> getPuniaCategory() async {
    final url = Uri.parse('$baseURL/punia-categories?fields[0]=name');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      print(response.body);
      return puniaCategoryDataFromJson(response.body);
    }
    return null;
  }

  static Future<PuniaProgramData?> getPuniaProgram({
    String bodyParam = '',
    int page = 1,
  }) async {
    final url = Uri.parse(
      '$baseURL/punia-programs?populate[punia_categories][fields][1]=id&pagination[pageSize]=14&pagination[page]=$page&$bodyParam',
    );

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      print(response.body);
      return puniaProgramDataFromJson(response.body);
    }
    return null;
  }

// static Future<PuniaProgram?> getPuniaProgram() async {
//   final url = Uri.parse('$baseURL/punia-programs');
//
//   final response = await http.get(url, headers: {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   });
//
//   if (response.statusCode == 200) {
//     return puniaProgramFromJson(response.body);
//   }
//   return null;
// }
//
// static Future<List<PuniaCategory>?> getPuniaCategory() async {
//   final url = Uri.parse('$baseURL/punia-categories');
//
//   final response = await http.get(url, headers: {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   });
//
//   if (response.statusCode == 200) {
//     return puniaCategoriesFromJson(response.body);
//   }
//   return null;
// }
}
