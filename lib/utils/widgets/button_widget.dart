import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback? onClicked;
  final bool? bFullContainerButton;

  final bool? isSecondary;
  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      this.bFullContainerButton,
      this.isSecondary})
      : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    if (widget.isSecondary != null) {
      return buttonSecondary();
    }
    return buttonIconMaterial();
  }

  Widget buttonSecondary() {
    return MaterialButton(
        minWidth: 100,
        height: MediaQuery.of(context).size.height / 15,
        color: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            side: BorderSide(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.text,
                style: themeData.textTheme.titleMedium!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        onPressed: widget.onClicked);
  }

  Widget buttonIconMaterial() {
    return MaterialButton(
        minWidth: 100,
        height: MediaQuery.of(context).size.height / 15,
        color: const Color.fromARGB(38, 255, 255, 255),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.text,
                style: themeData.textTheme.titleMedium!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        onPressed: widget.onClicked);
  }
}
