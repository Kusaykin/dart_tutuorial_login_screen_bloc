import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _emailField(bloc),
          _passwordFeald(bloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          _submitButton(bloc)
        ],
      ),
    );
  }

  Widget _emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error
          ),
        );
      },
    );
  }

  Widget _passwordFeald(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,            
            decoration: InputDecoration(
              hintText: 'password', 
              labelText: 'Password', 
              errorText: snapshot.error
            )
        );
      },
    );
  }

  Widget _submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'), 
          color: Colors.blue,
            onPressed: snapshot.hasData 
            ? bloc.submit
            : null
                         
        );
      }
    );  
  }
}
