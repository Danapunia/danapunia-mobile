part of '_model.dart';

PuniaProgramData puniaProgramDataFromJson(String str) {
  return PuniaProgramData.fromJson(json.decode(str));
}

class PuniaProgramData {
  List<PuniaProgram> data;
  Pagination pagination;

  PuniaProgramData({
    required this.data,
    required this.pagination,
  });

  factory PuniaProgramData.fromJson(Map<String, dynamic> json) {
    return PuniaProgramData(
      data: List<PuniaProgram>.from(json['data'].map(
        (x) => PuniaProgram.fromJson(x),
      )),
      pagination: Pagination.fromJson(json['meta']['pagination']),
    );
  }
}

class PuniaProgram {
  int? id;
  List<int>? puniaCategoryId;
  String? name;
  String? location;
  int? collectedFund;
  int? targetFund;
  DateTime? deadline;
  DateTime? createdAt;

  PuniaProgram({
    required this.id,
    required this.puniaCategoryId,
    required this.name,
    required this.location,
    required this.collectedFund,
    required this.targetFund,
    required this.deadline,
    required this.createdAt,
  });

  factory PuniaProgram.fromJson(Map<String, dynamic> json) {
    return PuniaProgram(
      id: json['id'],
      name: json['attributes']['name'],
      location: json['attributes']['location'],
      collectedFund: json['attributes']['collectedFund'],
      targetFund: json['attributes']['targetFund'],
      deadline: json['attributes']['deadline'] != null
          ? DateTime.parse(json['attributes']['deadline'])
          : null,
      createdAt: json['attributes']['createdAt'] != null
          ? DateTime.parse(json['attributes']['createdAt'])
          : null,
      puniaCategoryId: List<int>.from(
        json['attributes']['punia_categories']['data'].map((x) {
          return x['id'];
        }),
      ),
    );
  }
}
