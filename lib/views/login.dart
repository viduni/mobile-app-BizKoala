import 'package:flutter/material.dart';
import 'package:link/link.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Choice> choices = <Choice>[
    Choice(title: 'Home', link: 'https://bizkoala.com/'),
    Choice(title: 'Contact', link: 'https://bizkoala.com/contact.php'),
    Choice(title: 'FAQ', link: 'https://bizkoala.com/faq.php'),
    Choice(title: 'Pricing', link: 'https://bizkoala.com/pricing.php'),
  ];

  Choice _selectedChoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Quotations')),
        backgroundColor: Colors.green[600],
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.storage),
            onSelected: (Choice choice) {
              setState(() {
                _selectedChoice = choice;
              });
            },
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Link(url: choice.link, child: Text(choice.title)),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg-img.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1), BlendMode.dstATop)
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  String title;
  String link;

  Choice({this.title, this.link});
}
