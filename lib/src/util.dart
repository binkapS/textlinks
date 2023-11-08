import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:textlinks/src/element.dart';

class TextlinksUtil {
  TextlinksUtil(
    this.text,
    this.linkNames,
    this.style,
    this.linkStyle,
    this.onTap,
  ) {
    init();
  }

  final String text;

  final TextStyle? style;

  final TextStyle? linkStyle;

  RegExp regex = RegExp(
      r"((https?:www\.)|(https?:\/\/)|(www\.))?[\w/\-?=%.][-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");

  RegExp phoneRegex = RegExp(r"(^(?:[+0]9)?[0-9]{10,12}$)");

  final List<InlineSpan> children = <InlineSpan>[];

  final List<String> links = <String>[];

  final Map<String, String>? linkNames;

  final Function(TextLinksElement) onTap;

  final defaultStyle = const TextStyle(
    color: CupertinoColors.activeBlue,
  );

  void init() {
    Iterable<RegExpMatch> matches = regex.allMatches(text);
    for (RegExpMatch match in matches) {
      links.add(text.substring(match.start, match.end));
    }
    if (links.isEmpty) {
      children.add(
        TextSpan(
          text: text,
          style: style,
        ),
      );
      return;
    }
    buildLinks();
  }

  void buildLinks() {
    String temp = text;
    for (String value in links) {
      List<String> child = temp.split(value.trim());
      if (child[0].isNotEmpty) {
        children.add(
          TextSpan(
            text: child[0],
            style: linkStyle ?? defaultStyle,
            recognizer: TapGestureRecognizer().onTap = onTap(
              TextLinksElement(
                value,
                elementType(value),
              ),
            ),
          ),
        );
      }
    }
  }

  TextlinksElementType elementType(String value) {
    if (value.toString().contains('@') && !value.toString().contains('/')) {
      return TextlinksElementType.email;
    }
    return TextlinksElementType.url;
  }
}
