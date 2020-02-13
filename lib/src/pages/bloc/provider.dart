import 'package:flutter/material.dart';

import 'package:formvalidation/src/bloc/login_bloc.dart';

class Provider extends InheretedWidget {
  
  final loginBloc = LoginBloc();

  Provider({Key key, Widget child})
    : super(key: key, child: child);

  @override
  bool updateShowNotify (InheretedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
  
}