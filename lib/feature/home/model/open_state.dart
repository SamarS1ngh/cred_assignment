import 'open_state_body.dart';

class OpenState {
  OpenStateBody body;

  OpenState({
    required this.body,
  });

  factory OpenState.fromJson(Map<String, dynamic> json) => OpenState(
        body: OpenStateBody.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "body": body.toJson(),
      };
}
