part of '_model.dart';

PuniaCategoryData puniaCategoryDataFromJson(String str) {
  return PuniaCategoryData.fromJson(json.decode(str));
}

class PuniaCategoryData {
  List<PuniaCategory> data;
  Pagination pagination;

  PuniaCategoryData({
    required this.data,
    required this.pagination,
  });

  factory PuniaCategoryData.fromJson(Map<String, dynamic> json) {
    return PuniaCategoryData(
      data: List<PuniaCategory>.from(json['data'].map(
        (x) => PuniaCategory.fromJson(x),
      )),
      pagination: Pagination.fromJson(json['meta']['pagination']),
    );
  }
}

class PuniaCategory {
  int id;
  String name;
  bool selected = false;

  PuniaCategory({
    required this.id,
    required this.name,
    this.selected = false,
  });

  factory PuniaCategory.fromJson(Map<String, dynamic> json) {
    return PuniaCategory(
      id: json['id'],
      name: json['attributes']['name'],
    );
  }
}
