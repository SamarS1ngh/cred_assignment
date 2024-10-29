import 'package:cred_assignment/core/providers.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cred_assignment/feature/home/model/card.dart' as card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class RadialSliderScreen extends ConsumerStatefulWidget {
  final dynamic cardData;
  const RadialSliderScreen({super.key, required this.cardData});

  @override
  _RadialSliderScreenState createState() => _RadialSliderScreenState();
}

class _RadialSliderScreenState extends ConsumerState<RadialSliderScreen> {
  double _creditAmount = 500;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
      child: RadialSlider(
        cardData: widget.cardData,
        creditAmount: _creditAmount,
        onValueChanged: (value) {
          setState(() {
            _creditAmount = value;
            ref.read(homePageProvider.notifier).creditAmount = value;
          });
        },
      ),
    );
  }
}

class RadialSlider extends StatefulWidget {
  final double creditAmount;
  final ValueChanged<double> onValueChanged;
  final card.Card cardData;

  const RadialSlider(
      {super.key,
      required this.creditAmount,
      required this.onValueChanged,
      required this.cardData});

  @override
  _RadialSliderState createState() => _RadialSliderState();
}

class _RadialSliderState extends State<RadialSlider> {
  double _currentAngle = 0;
  final double _minAmount = 500;
  final double _maxAmount = 487891;

  @override
  void initState() {
    super.initState();
    _currentAngle = _amountToAngle(widget.creditAmount);
  }

  double _angleToAmount(double angle) {
    return (angle / (2 * pi)) * _maxAmount;
  }

  double _amountToAngle(double amount) {
    return (amount / _maxAmount) * (2 * pi);
  }

  void _updatePosition(Offset position, Size size) {
    final double dx = position.dx - size.width / 2;
    final double dy = position.dy - size.height / 2;
    double angle = atan2(dy, dx) + pi / 2;

    // Normalize the angle to be within [0, 2 * pi]
    if (angle < 0) {
      angle += 2 * pi;
    }

    // Ensure the angle does not exceed 2 * pi
    if (angle > 2 * pi) {
      angle -= 2 * pi;
    }
    setState(() {
      _currentAngle = angle;

      // Calculate the new amount based on the angle
      double newAmount = _angleToAmount(angle);

      // Clamp the new amount to the minimum and maximum values
      newAmount = newAmount < _minAmount ? _minAmount : newAmount;
      newAmount = newAmount > _maxAmount ? _maxAmount : newAmount;

      // Update the credit amount
      widget.onValueChanged(newAmount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        _updatePosition(details.localPosition, const Size(100, 100));
      },
      child: CustomPaint(
        size: const Size(260, 260),
        painter: RadialSliderPainter(
            _currentAngle, widget.creditAmount, widget.cardData),
      ),
    );
  }
}

class RadialSliderPainter extends CustomPainter {
  final double angle;
  final double creditAmount;
  final card.Card cardData;

  RadialSliderPainter(this.angle, this.creditAmount, this.cardData);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFd7876a)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Draw the radial background
    canvas.drawCircle(center, radius, paint..color = const Color(0xfffce7e2));

    // Draw the active radial bar
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, paint..color = const Color(0xFFd7876a));

    final handleX = center.dx + radius * cos(angle - pi / 2);
    final handleY = center.dy + radius * sin(angle - pi / 2);
    canvas.drawCircle(
        Offset(handleX, handleY), 10.0, Paint()..color = Colors.black);

    TextPainter creditAmountText = TextPainter(
      text: TextSpan(
        text: 'Credit Amount',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    creditAmountText.layout();
    creditAmountText.paint(
        canvas,
        Offset(center.dx - creditAmountText.width / 2,
            center.dy - creditAmountText.height - 20));

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '₹ ${creditAmount.toInt()}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 21.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(center.dx - textPainter.width / 2,
            center.dy - textPainter.height / 2));

    TextPainter percentageText = TextPainter(
      text: TextSpan(
        text: cardData.description,
        style: TextStyle(
          color: Colors.green,
          fontSize: 15.0.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    percentageText.layout();
    percentageText.paint(
        canvas,
        Offset(center.dx - percentageText.width / 2,
            center.dy + textPainter.height)); // Below the amount
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
