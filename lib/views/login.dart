import 'package:flutter/material.dart';
import 'package:link/link.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

import 'package:mobile_app/providers/auth.dart';
import 'package:mobile_app/utils/validate.dart';
import 'package:mobile_app/styles/styles.dart';
import 'package:mobile_app/widgets/notification_text.dart';
import 'package:mobile_app/widgets/styled_flat_button.dart';


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

class LogInForm extends StatefulWidget {
  const LogInForm({Key key}) : super(key: key);

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String message = '';

  Future<void> submit() async {
    final form = _formKey.currentState;
    if(form.validate()){
      await Provider.of<AuthProvider>(context).login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: null,
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20)
            ),
          ),
          SizedBox(height: 10.0),
          Consumer<AuthProvider>(
            builder: (context, provider, child) => provider.notification ?? NotificationText(''),
          ),
          
        ],
      ),
    );
  }
}