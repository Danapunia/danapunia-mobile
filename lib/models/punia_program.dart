part of '_model.dart';

PuniaProgramData puniaProgramDataFromJson(String str) {
  return PuniaProgramData.fromJson(json.decode(str));
}

List<PuniaProgram> puniaProgramFromJson(String str) {
  return List<PuniaProgram>.from(
    json.decode(str)['data'].map((x) => PuniaProgram.fromJson(x)),
  );
}

class PuniaProgramData {
  var data = RxList<PuniaProgram>();
  Pagination pagination;

  PuniaProgramData({
    required this.data,
    required this.pagination,
  });

  factory PuniaProgramData.fromJson(Map<String, dynamic> json) {
    return PuniaProgramData(
      data: RxList<PuniaProgram>.from(json['data'].map(
        (x) => PuniaProgram.fromJson(x),
      )),
      pagination: Pagination.fromJson(json['meta']['pagination']),
    );
  }
}

class PuniaProgram {
  int? id;
  List<int>? puniaCategoryId;
  int? organizationId;
  String? name;
  String? imageURL;
  String? location;
  int? collectedFund;
  int? targetFund;
  DateTime? deadline;
  DateTime? createdAt;
  Organization? organization;

  PuniaProgram({
    required this.id,
    required this.puniaCategoryId,
    required this.organizationId,
    required this.name,
    required this.imageURL,
    required this.location,
    required this.collectedFund,
    required this.targetFund,
    required this.deadline,
    required this.createdAt,
    this.organization,
  });

  factory PuniaProgram.fromJson(Map<String, dynamic> json) {
    return PuniaProgram(
      id: json['id'],
      name: json['attributes']['name'],
      imageURL: json["attributes"]["image"]["data"] != null
          ? json["attributes"]["image"]["data"]["attributes"]["url"]
          : null,
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
      organizationId: json['attributes']['organisase']['data'] != null
          ? json['attributes']['organisase']['data']['id']
          : null,
      organization: json['attributes']['organisase']['data'] != null
          ? Organization.fromJson(json['attributes']['organisase']['data'])
          : null,
    );
  }
}
