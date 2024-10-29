class Card {
  String header;
  String description;
  int maxRange;
  int minRange;

  Card({
    required this.header,
    required this.description,
    required this.maxRange,
    required this.minRange,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        header: json["header"] ?? "",
        description: json["description"] ?? "",
        maxRange: json["max_range"] ?? 0,
        minRange: json["min_range"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "header": header,
        "description": description,
        "max_range": maxRange,
        "min_range": minRange,
      };
}
