part of '_model.dart';

List<Bank> bankFromJson(String str) {
  return List<Bank>.from(
    jsonDecode(str)['data'].map((x) => Bank.fromJson(x)),
  );
}

class Bank {
  int id;
  String accountName;
  int accountNumber;
  String accountProvider;

  Bank({
    required this.id,
    required this.accountName,
    required this.accountNumber,
    required this.accountProvider,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'],
      accountName: json['attributes']['accountName'],
      accountNumber: json['attributes']['accountNumber'],
      accountProvider: json['attributes']['accountProvider'],
    );
  }
}
