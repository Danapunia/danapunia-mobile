import 'package:danapunia_mobile/config/config.dart';
import 'package:danapunia_mobile/models/_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<PuniaCategoryData?> getPuniaCategory() async {
    final url = Uri.parse('$apiURL/punia-categories?fields[0]=name');

    final response = await http.get(url, headers: _getHeaders);

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
      '$apiURL/punia-programs?populate[punia_categories][fields][0]=id&populate[image][fields][1]=url&populate[organisase][fields][2]=id&pagination[pageSize]=10&pagination[page]=$page&$bodyParam',
    );

    // print('URL $url');
    debugPrint('URL $url');

    final response = await http.get(url, headers: _getHeaders);

    if (response.statusCode == 200) {
      print(response.body);
      return puniaProgramDataFromJson(response.body);
    }
    return null;
  }

  static Future<List<PuniaProgram>> searchPuniaProgram(String keyword) async {
    final url = Uri.parse(
      '$apiURL/punia-programs?populate[punia_categories][fields][0]=id&populate[image][fields][1]=url&pagination[pageSize]=10&pagination[page]=1&filters[name][\$containsi]=$keyword',
    );

    final response = await http.get(url, headers: _getHeaders);

    if (response.statusCode == 200) {
      print(response.body);
      return puniaProgramFromJson(response.body);
    }
    return [];
  }

  static Future<Organization?> getOrganization(int id) async {
    final url = Uri.parse(
      '$apiURL/organisasis?fields[0]=KodeOrganisasi&fields[1]=NamaOrganisasi&fields[2]=TipeOrganisasi&filters[id][\$eq]=$id',
    );

    final response = await http.get(url, headers: _getHeaders);

    if (response.statusCode == 200) {
      print(response.body);
      return organizationFromJson(response.body);
    }
    return null;
  }

  static get _getHeaders => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
