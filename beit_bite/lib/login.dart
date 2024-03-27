import 'package:beit_bite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AccountType { none, chef, customer }

class loginpage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = ref.watch(navigationProvider);
    final screenSize = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: screenSize.width / 2,
                    width: screenSize.width / 2,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                width: screenSize.width * 0.7,
                height: 70,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(100.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF153F54))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF153F54))),
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    prefixIconColor: Color(0xFF153F54),
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 2),
              Container(
                padding: EdgeInsets.all(5.0),
                width: screenSize.width * 0.7,
                height: 70,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(100.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF153F54))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF153F54))),
                    prefixIcon: Icon(Icons.password),
                    prefixIconColor: Color(0xFF153F54),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF153F54),
                ),
                padding: EdgeInsets.all(8.0),
                width: screenSize.width * 0.7,
                height: 70,
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('You forgot something!')));
                    }
                  },
                  child: Center(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Bubblegum',
                        fontSize: screenSize.width / 15,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? '),
                  TextButton(
                      onPressed: () {
                        navigationService.navigateTo('/signuppage');
                      },
                      child: Text(
                        'Sign up.',
                        style: TextStyle(color: Color(0xFFFFA07A)),
                      ))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Forgot password? '),
                  TextButton(
                      onPressed: () {
                        navigationService.navigateTo('/signuppage');
                      },
                      child: Text(
                        'Reset.',
                        style: TextStyle(color: Color(0xFFFFA07A)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
