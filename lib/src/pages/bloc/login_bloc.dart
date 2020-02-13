import 'dart:async';

class LogicBloc {

  final _emailController = StreamController<String>.broadcast();
  final _passwordController  = StreamController<String>.broadcast();

  //Escuchar los datos del Stream
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  //Insertar valores al Stream
  Funtion(String) get changeEmail => _emailController.sink.add;
  Funtion(String) get changePassword => _passwordController.sink.add;

  dispose(){
    //? es para validar que no sea nulo porque daría error
    _emailController?.close();
    _passwordController?.close();
  }

}
