import 'closed_state.dart';
import 'open_state.dart';

class BankItem {
  OpenState openState;
  ClosedState closedState;
  String ctaText;

  BankItem({
    required this.openState,
    required this.closedState,
    required this.ctaText,
  });

  factory BankItem.fromJson(Map<String, dynamic> json) => BankItem(
        openState: OpenState.fromJson(json["open_state"]),
        closedState: ClosedState.fromJson(json["closed_state"]),
        ctaText: json["cta_text"],
      );

  Map<String, dynamic> toJson() => {
        "open_state": openState.toJson(),
        "closed_state": closedState.toJson(),
        "cta_text": ctaText,
      };
}
