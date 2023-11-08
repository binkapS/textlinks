library textlinks;

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:textlinks/src/element.dart';
import 'package:textlinks/src/util.dart';

class Textlinks extends StatelessWidget {
  const Textlinks({
    super.key,
    required this.text,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor = 1.0,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
    this.selectionRegistrar,
    this.selectionColor,
    this.linkNames,
    required this.onTap,
  });

  final String text;

  final TextStyle? style;

  final TextStyle? linkStyle;

  final int? maxLines;

  final TextAlign textAlign;

  final TextDirection? textDirection;

  final bool softWrap;

  final TextOverflow overflow;

  final double textScaleFactor;

  final Locale? locale;

  final StrutStyle? strutStyle;

  final TextWidthBasis textWidthBasis;

  final TextHeightBehavior? textHeightBehavior;

  final SelectionRegistrar? selectionRegistrar;

  final Color? selectionColor;

  final Map<String, String>? linkNames;

  final Function(TextLinksElement) onTap;

  @override
  Widget build(BuildContext context) {
    final TextlinksUtil util = TextlinksUtil(
      text,
      linkNames,
      style,
      linkStyle,
      onTap,
    );
    return RichText(
      text: TextSpan(
        children: util.children,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionRegistrar: selectionRegistrar,
      selectionColor: selectionColor,
    );
  }
}
