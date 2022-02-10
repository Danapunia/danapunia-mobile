part of '_model.dart';

Organization organizationFromJson(String str) {
  return Organization.fromJson(json.decode(str)['data'][0]);
}

class Organization {
  int id;
  String kodeOrganisasi;
  String namaOrganisasi;
  String tipeOrganisasi;

  Organization({
    required this.id,
    required this.kodeOrganisasi,
    required this.namaOrganisasi,
    required this.tipeOrganisasi,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'],
      kodeOrganisasi: json['attributes']['KodeOrganisasi'],
      namaOrganisasi: json['attributes']['NamaOrganisasi'],
      tipeOrganisasi: json['attributes']['TipeOrganisasi'],
    );
  }
}
