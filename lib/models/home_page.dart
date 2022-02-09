part of '_model.dart';

HomePageData homePageFromJson(String str) {
  return HomePageData.fromJson(json.decode(str));
}

class HomePageData {
  List<PuniaProgram> puniaProgram;
  Pagination pagination;

  HomePageData({
    required this.puniaProgram,
    required this.pagination,
  });

  factory HomePageData.fromJson(Map<String, dynamic> json) {
    return HomePageData(
      puniaProgram: List<PuniaProgram>.from(
        json["data"].map((x) => PuniaProgram.fromJson(x)),
      ),
      pagination: Pagination.fromJson(json['meta']['pagination']),
    );
  }
}
