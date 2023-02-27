import 'dart:io';


import 'package:azure_reborn/screen/home_body/home_body.dart';
import 'package:azure_reborn/screen/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:azure_reborn/screen/splash_screen/splash_screen.dart';
import 'package:azure_reborn/widget/FlushBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../additional/constant.dart';
import '../../additional/preferences.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
 

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _passwordVisible = true;

  ///Function untuk toggle obscure text password
  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  String serverUrl = '';
  String code = 'DEFAULT';

  @override
  void initState() {
    
    super.initState();
  }
  
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;
  bool isChecked = false;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) async {
          if (state is onSignInLoading){
            setState(() {
              isLoading = true;
            });
          } else if (state is onSignInSuccess){

            if(Preferences.getInstance().contain(SharedPreferenceKey.ProcessorKey)){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeBody(),
                  ));
            }else{
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ));
            }
          } else if (state is onSignInFailed){
            FlushBarWidget.showFailure(state.message).show(context);
          } else if (state is onSignInFinished){
            setState(() {
              isLoading = false;
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08, bottom: 10),
                    child: Center(
                        child: Image.asset('assets/image/icons/azurenewlogo_round.png')),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'login_title',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'login_title2',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Form(
                    child: AutofillGroup(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                                labelText: 'login_username',
                                prefixIcon: Icon(Icons.account_box_sharp)),
                            autofillHints: const [AutofillHints.email],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            autofillHints: const [AutofillHints.password],
                            onEditingComplete: () =>
                                TextInput.finishAutofillContext(),
                            decoration: InputDecoration(
                              labelText: 'login_password',
                              prefixIcon: const Icon(Icons.key),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _toggle();
                                },
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            obscureText: _passwordVisible,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                              onPressed: () async {
                                context.read<SignInBloc>().add(onSignIn(username: _usernameController.text, password: _passwordController.text));
                              },
                              child: Text('login_button'),
                              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
