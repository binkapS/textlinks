import 'package:flutter/material.dart';
import 'package:flutter_textlinks/textlinks.dart';

void main() => runApp(
      MaterialApp(
        title: 'Textlinks Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Textlinks(
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
          ),
        ),
      ),
    );
  }
}
