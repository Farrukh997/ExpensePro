import 'package:expense_pro/core/presentation/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinInputArray extends StatefulWidget {
  const PinInputArray({super.key});

  @override
  State<PinInputArray> createState() => _PinInputArrayState();
}

class _PinInputArrayState extends State<PinInputArray> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        PinInput(),
        PinInput(),
        PinInput(),
        PinInput(),
        PinInput(),
        PinInput(),
      ],
    );
  }
}

class PinInput extends StatefulWidget {
  const PinInput({super.key});

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  final textController = TextEditingController();

  @override
  void activate() {
    super.activate();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PinInput oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(StringProperty(name, value));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: textController.text.isEmpty ? 24.0 : 36.0,
      width: textController.text.isEmpty ? 24.0 : 36.0,
      duration: const Duration(seconds: 1),
      child: TextField(
        autofocus: true,
        focusNode: primaryFocus,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (value) {
          setState(() {
            textController.text = value;
          });
        },
        textAlignVertical: TextAlignVertical.bottom,
        textAlign: TextAlign.center,
        style: AppTextStyle.title0,
        cursorHeight: 24.0,
        showCursor: false,
        mouseCursor: MouseCursor.defer,
        controller: textController,
        decoration: textController.text.isEmpty
            ? InputDecoration(
                counterText: '',
                alignLabelWithHint: true,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                filled: true,
                fillColor: const Color(0xFFE0E2E9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
              )
            : const InputDecoration(
                filled: false,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusColor: null,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
      ),
    );
  }
}
