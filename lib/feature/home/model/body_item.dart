class BodyItem {
  String emi;
  String duration;
  String title;
  dynamic subtitle;
  String tag;
  String icon;

  BodyItem({
    required this.emi,
    required this.duration,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.icon,
  });

  factory BodyItem.fromJson(Map<String, dynamic> json) => BodyItem(
        emi: json["emi"] ?? "",
        duration: json["duration"] ?? "",
        title: json["title"],
        subtitle: json["subtitle"],
        tag: json["tag"] ?? "",
        icon: json["icon"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "emi": emi,
        "duration": duration,
        "title": title,
        "subtitle": subtitle,
        "tag": tag,
        "icon": icon,
      };
}
