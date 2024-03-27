import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:beit_bite/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AccountType { none, chef, customer }

final isChefProvider = StateProvider<AccountType>((ref) => AccountType.none);

class signuppage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = ref.watch(navigationProvider);
    final screenSize = MediaQuery.of(context).size;
    final isChef = ref.watch(isChefProvider);
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
              Center(
                child: Text(
                  'Choose Account Type',
                  style: TextStyle(
                    color: Color(0xFF153F54),
                    fontFamily: 'Bubblegum',
                    fontSize: screenSize.width / 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => ref.read(isChefProvider.notifier).state =
                        AccountType.chef,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (ref.read(isChefProvider.notifier).state ==
                                AccountType.chef)
                            ? Color(0xFFffede6)
                            : Colors.white,
                      ),
                      height: screenSize.width / 3,
                      width: screenSize.width / 3,
                      child: Image.asset('assets/images/chef.png'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => ref.read(isChefProvider.notifier).state =
                        AccountType.customer,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (ref.read(isChefProvider.notifier).state ==
                                AccountType.customer)
                            ? Color(0xFFffede6)
                            : Colors.white,
                      ),
                      height: screenSize.width / 3,
                      width: screenSize.width / 3,
                      child: Image.asset('assets/images/customer.png'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 40,
                    width: screenSize.width / 3,
                    child: Center(child: Text('Chef')),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 40,
                    width: screenSize.width / 3,
                    child: Center(child: Text('Customer')),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                width: screenSize.width * 0.7,
                height: 80,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(80.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF153F54))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF153F54))),
                    prefixIcon: Icon(Icons.email_outlined),
                    prefixIconColor: Color(0xFF153F54),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(8.0),
                width: screenSize.width * 0.7,
                height: 80,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(80.0),
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
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(8.0),
                width: screenSize.width * 0.7,
                height: 80,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(80.0),
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
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFFA07A),
                ),
                padding: EdgeInsets.all(8.0),
                width: screenSize.width * 0.7,
                height: 70,
                child: GestureDetector(
                  onTap: () {
                    if (isChef != AccountType.none) {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));

                        isChef == AccountType.customer
                            ? navigationService.navigateTo('/customerhome')
                            : print('kjckjck');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('You forgot something!')));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please select account type!')));
                    }
                  },
                  child: Center(
                    child: Text(
                      'Sign up',
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  TextButton(
                      onPressed: () {
                        navigationService.navigateTo('/loginpage');
                      },
                      child: Text(
                        'Log in.',
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
