import 'closed_state_body.dart';

class ClosedState {
  ClosedStateBody body;

  ClosedState({
    required this.body,
  });

  factory ClosedState.fromJson(Map<String, dynamic> json) => ClosedState(
        body: ClosedStateBody.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "body": body.toJson(),
      };
}
