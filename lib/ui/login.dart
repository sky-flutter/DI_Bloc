import 'package:dependency_injection/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 24),
          child: LoginForm(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  String email, password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 48,),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (BuildContext context, state) {
              if (state is LoginFailed) {
                return Text(state.errorMessage);
              } else {
                return Container();
              }
            },
          ),
          TextFormField(
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            keyboardType: TextInputType.emailAddress,
            onChanged: (str) {
              email = str;
            },
            validator: (str) {
              return str.length > 0 ? null : "Enter email";
            },
            decoration: InputDecoration(
              hintText: "Email",
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            obscureText: true,
            onChanged: (str) {
              password = str;
            },
            validator: (str) {
              return str.length > 0 ? null : "Enter password";
            },
            decoration: InputDecoration(
              hintText: "Password",
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginInitiated) {
                return CircularProgressIndicator();
              } else {
                return RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      BlocProvider.of<LoginBloc>(context)
                        ..add(LoginAuthentication(email, password));
                    }
                  },
                  child: Text("Submit"),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
