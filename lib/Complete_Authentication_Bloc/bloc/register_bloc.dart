import 'package:rxdart/rxdart.dart';

class RegisterBloc
{
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();

  /// Getters
  Stream<String> get name {
    return _name.stream;
  }
  Stream<String> get email {
    return _email.stream;
  }
  Stream<String> get phoneNumber {
    return _phoneNumber.stream;
  }
  Stream<String> get password {
    return _password.stream;
  }
  Stream<String> get confirmPassword {
    return _confirmPassword.stream;
  }


  /// Setters
  Function(String) get changeName {
    return _name.sink.add;
  }
  Function(String) get changeEmail {
    return _email.sink.add;
  }
  Function(String) get changePhoneNumber {
    return _phoneNumber.sink.add;
  }
  Function(String) get changePassword {
    return _password.sink.add;
  }
  Function(String) get changeConfirmPassword {
    return _confirmPassword.sink.add;
  }

  void dispose()
  {
    _name.close();
    _email.close();
    _phoneNumber.close();
    _password.close();
    _confirmPassword.close();
  }
}