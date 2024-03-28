import "package:bloc_state_management/Complete_Authentication_Bloc/bloc/login_bloc.dart";
import "package:bloc_state_management/Complete_Authentication_Bloc/bloc/register_bloc.dart";
import "package:bloc_state_management/Complete_Authentication_Bloc/screens/register_screen.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context) {  return LoginBloc();  },),
        Provider<RegisterBloc>(create: (context) {  return RegisterBloc();  },),
      ],
      child: MaterialApp(
        title: "Complete Authentication using Bloc",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState()
  {
    return LoginScreenState();
  }
}
class LoginScreenState extends State<LoginScreen>
{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: false);
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Complete Authentication using Bloc",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
                  const SizedBox(height: 30.0),
                  StreamBuilder<String>(
                    stream: bloc.loginEmail,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter the Email",
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                        ),
                        onChanged: (value) {
                          bloc.changeLoginEmail;
                          // return print(value);
                        },
                      );
                    }
                  ),
                  const SizedBox(height: 30.0),
                  StreamBuilder<String>(
                    stream: bloc.loginPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "Enter the Password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                        ),
                        onChanged: (value) {
                          bloc.changeLoginPassword;
                          // return print(value);
                        },
                      );
                    }
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: const Size(200.0, 50.0),
                    ),
                    child: const Text("Login",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Need an account? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const WidgetSpan(
                          child: SizedBox(width: 5.0),
                        ),
                        TextSpan(
                          text: "Register",
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                          recognizer: TapGestureRecognizer() ..onTap = () {
                            /// Navigate to Registration screen
                            Navigator.pushReplacement(context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegistrationScreen();
                              },
                            ),);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}