import 'body_item.dart';
import 'card.dart';

class OpenStateBody {
  String title;
  String subtitle;
  Card card;
  String footer;
  List<BodyItem> items;

  OpenStateBody({
    required this.title,
    required this.subtitle,
    required this.card,
    required this.footer,
    required this.items,
  });

  factory OpenStateBody.fromJson(Map<String, dynamic> json) => OpenStateBody(
        title: json["title"],
        subtitle: json["subtitle"],
        card: Card.fromJson(json["card"] ?? {}),
        footer: json["footer"],
        items: List<BodyItem>.from(
            (json["items"] ?? []).map((x) => BodyItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "card": card.toJson(),
        "footer": footer,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
