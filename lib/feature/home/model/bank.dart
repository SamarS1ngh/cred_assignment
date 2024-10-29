// To parse this JSON data, do
//
//     final bank = bankFromJson(jsonString);

import 'dart:convert';

import 'bank_item.dart';

Bank bankFromJson(String str) => Bank.fromJson(json.decode(str));

String bankToJson(Bank data) => json.encode(data.toJson());

class Bank {
  List<BankItem> items;

  Bank({
    required this.items,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        items:
            List<BankItem>.from(json["items"].map((x) => BankItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
