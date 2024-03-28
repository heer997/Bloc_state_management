import 'package:rxdart/rxdart.dart';

class LoginBloc
{
  final _loginEmail = BehaviorSubject<String>();
  final _loginPassword = BehaviorSubject<String>();

  /// Getters
  Stream<String> get loginEmail {
    return _loginEmail.stream;
  }
  Stream<String> get loginPassword {
    return _loginPassword.stream;
  }

  /// Setters
  Function(String) get changeLoginEmail {
    return _loginEmail.sink.add;
  }
  Function(String) get changeLoginPassword {
    return _loginPassword.sink.add;
  }

  void dispose()
  {
    _loginEmail.close();
    _loginPassword.close();
  }
}