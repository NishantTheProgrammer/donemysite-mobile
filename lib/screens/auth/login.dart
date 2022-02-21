import 'package:flutter/material.dart';
import 'package:mobile/tabs.dart';

class Login extends StatefulWidget {
  final routeName = 'login';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final sizedBoxSpace = SizedBox(height: 14);
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  onSubmit(context) {
    final form = _formKey.currentState;

    if (form!.validate()) {
      final payload = {
        'username': usernameController.text,
        'password': passwordController.text
      };
      FocusScope.of(context).requestFocus(FocusNode());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fake login as ${usernameController.text}'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
        ),
      );
      print(payload);
      Navigator.pushNamed(context, Tabs().routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/illustrations/login.png',
                  height: 300,
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Username",
                  ),
                  validator: (username) {
                    if (username == '') {
                      return 'Please enter a valid username';
                    }
                  },
                ),
                sizedBoxSpace,
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  validator: (password) {
                    if (password == '') {
                      return 'Please enter a valid username';
                    }
                  },
                ),
                sizedBoxSpace,
                ElevatedButton(
                    onPressed: () => onSubmit(context), child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
