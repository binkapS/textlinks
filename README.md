# Textlinks

[![pub package](https://img.shields.io/pub/v/flutter_textlinks.svg)](https://pub.dartlang.org/packages/flutter_textlinks)

A lightweight flutter package that linkifies a text containing urls, emails.

## Without passing linkNames
   <p> <img src="https://raw.githubusercontent.com/binkapS/textlinks/master/assets/s1.png" width="200px" height="auto" hspace="20"/></p>

## With  passinglinkNames
   <p> <img src="https://raw.githubusercontent.com/binkapS/textlinks/master/assets/s2.png" width="200px" height="auto" hspace="20"/></p>


## Install

Install by adding this package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_textlinks: <latest>
```


## Usage

To use this package, add `flutter_textlinks` as a [dependency in your pubspec.yaml file](https://pub.dev/packages/flutter_textlinks/).

to `/example` folder.

```dart
import 'package:flutter_textlinks/textlinks.dart';

    Textlinks(
            text:
                'Binkap Commented on your photo tiger@binkap.com in Programming Jokes & Memes https://binkap.com for more information',
            onTap: (TextlinksElement element) {
              if (element.type == TextlinksElementType.url) {
                // do some with the url
                return;
              }

              if (element.type == TextlinksElementType.email) {
                // do something with the email
                return;
              }
            },
            style: TextStyle(
              color: Colors.black,
            ),
            linkNames: {
              "tiger@binkap.com": 'Email',
              "https://binkap.com": 'Link'
            }, // Pass link names to use and labels for specified links
            options: TextlinksOptions(
              humanize: true,
            ),
          );
```

## Additional information


#### TextlinksElementTypes

| Parameter | Type     | Description                                          |
| :-------- | :------- | :--------------------------------------------------- |
| `type`    | `TextlinksElementType`   | the link type either url, email      |
| `link`    | `String` | value the link holds                                 |
