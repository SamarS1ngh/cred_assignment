class ClosedStateBody {
  String key1;
  String key2;

  ClosedStateBody({
    required this.key1,
    required this.key2,
  });

  factory ClosedStateBody.fromJson(Map<String, dynamic> json) =>
      ClosedStateBody(
        key1: json["key1"] ?? "",
        key2: json["key2"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "key1": key1,
        "key2": key2,
      };
}
