import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_textlinks/src/element.dart';

class TextlinksUtil {
  TextlinksUtil({
    required this.text,
    this.linkNames,
    this.style,
    this.linkStyle,
    required this.onTap,
    this.options,
  }) {
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

  final Function(TextlinksElement) onTap;

  final defaultStyle = const TextStyle(
    color: CupertinoColors.activeBlue,
  );

  final TextlinksOptions? options;
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
            style: style,
          ),
        );
        String name = value;
        if (linkNames != null) {
          if (linkNames!.containsKey(value)) {
            name = ((linkNames![value] != null || linkNames![value]!.isNotEmpty)
                ? linkNames![value]
                : value)!;
          }
        } else if (options != null && isUrl(value)) {
          if (options!.humanize) {
            final scheme = urlScheme(value);
            name = value.substring(
                (value.indexOf(scheme['scheme']) + scheme['length'] as int));
          }
        }
        children.add(
          TextSpan(
            text: name,
            style: linkStyle ?? defaultStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => onTap(
                    TextlinksElement(
                      value,
                      elementType(value),
                    ),
                  ),
          ),
        );
        if (child[1].isNotEmpty) {
          if (value == links.last) {
            children.add(
              TextSpan(
                text: child[1],
                style: style,
              ),
            );
          } else {
            temp = child[1];
          }
        }
      }
    }
  }

  TextlinksElementType elementType(String value) {
    if (isEmail(value)) {
      return TextlinksElementType.email;
    }
    return TextlinksElementType.url;
  }

  bool isEmail(String value) {
    return (value.toString().contains('@') && !value.toString().contains('/'));
  }

  bool isUrl(String value) {
    return (value.contains('http://') ||
        value.contains('https://') ||
        value.contains('www.'));
  }

  Map<String, dynamic> urlScheme(String value) {
    if (value.contains('http://')) {
      return {'scheme': 'http://', 'length': 7};
    }
    return {'scheme': 'https://', 'length': 8};
  }
}
