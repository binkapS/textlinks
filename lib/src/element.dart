enum TextlinksElementType {
  url,
  email,
  phone,
}

class TextLinksElement {
  TextLinksElement(this.link, this.type);

  final String link;

  final TextlinksElementType type;
}
