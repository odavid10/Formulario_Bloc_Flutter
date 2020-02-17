import 'dart:async';
import 'package:rxdart/rxdart.dart';

export 'package:formvalidation/src/bloc/validators.dart';

class LogicBloc with Validators {

  final _emailController = BehaviorSubject<String>();
  final _passwordController  = BehaviorSubject<String>();

  //Escuchar los datos del Stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  Stream<bool> get formValidStream => 
    CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  //Insertar valores al Stream
  Funtion(String) get changeEmail => _emailController.sink.add;
  Funtion(String) get changePassword => _passwordController.sink.add;

  //Obtener el ultimo valor de los streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    //? es para validar que no sea nulo porque daría error
    _emailController?.close();
    _passwordController?.close();
  }

}
