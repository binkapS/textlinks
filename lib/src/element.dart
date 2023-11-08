enum TextlinksElementType {
  url,
  email,
  phone,
}

class TextlinksElement {
  TextlinksElement(this.link, this.type);

  final String link;

  final TextlinksElementType type;
}

class TextlinksOptions {
  TextlinksOptions({
    this.humanize = true,
  });

  final bool humanize;
}
