import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const CustomSlider({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _currentValue = 0.0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbShape: CustomSliderThumbShape(),
        trackShape: CustomTrackShape(),
        trackHeight: 8.0,
        activeTrackColor: AppColors.violet100,
        inactiveTrackColor: AppColors.light40,
      ),
      child: Slider(
        value: _currentValue,
        min: widget.min,
        max: widget.max,
        onChanged: (value) {
          setState(() => _currentValue = value);
          widget.onChanged(value);
        },
        label: '$_currentValue',
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx + 2.0;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width - 4.0;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(12.0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final paint = Paint()
      ..color = AppColors.light100
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: center,
          width: 64.0,
          height: 32.0,
        ),
        const Radius.circular(24.0),
      ),
      paint,
    );
    paint.color = AppColors.violet100;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: center,
          width: 48.0,
          height: 32.0,
        ),
        const Radius.circular(24.0),
      ),
      paint,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: '${(value! * 100).round()}%',
        style: AppTextStyle.bodyMedium.copyWith(
          color: AppColors.light100,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      textScaleFactor: textScaleFactor ?? 1.0,
    );

    textPainter.layout();
    final textPainterOffset = Offset(
      center.dx - textPainter.width / 2.0,
      center.dy - textPainter.height / 2.0,
    );
    textPainter.paint(canvas, textPainterOffset);
  }
}
