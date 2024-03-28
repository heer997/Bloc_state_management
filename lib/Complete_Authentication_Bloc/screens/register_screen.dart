import "package:bloc_state_management/Complete_Authentication_Bloc/bloc/register_bloc.dart";
import "package:bloc_state_management/Complete_Authentication_Bloc/screens/login_screen.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() {
    return RegistrationScreenState();
  }
}

class RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isVisible2 = true;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterBloc>(context, listen: false);
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Registration Screen",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    const SizedBox(height: 30.0),
                    StreamBuilder<String>(
                        stream: bloc.name,
                        builder: (context, snapshot) {
                          return TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Enter the Name",
                              labelText: "Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                            ),
                            onChanged: (value) {
                              bloc.changeName;
                              // return print(value);
                            },
                          );
                        }),
                    const SizedBox(height: 30.0),
                    StreamBuilder<String>(
                        stream: bloc.email,
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
                              bloc.email;
                              // return print(value);
                            },
                          );
                        }),
                    const SizedBox(height: 30.0),
                    StreamBuilder<String>(
                        stream: bloc.phoneNumber,
                        builder: (context, snapshot) {
                          return TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Enter the Phone Number",
                              labelText: "Phone Number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                            ),
                            onChanged: (value) {
                              bloc.phoneNumber;
                              // return print(value);
                            },
                          );
                        }),
                    const SizedBox(height: 30.0),
                    StreamBuilder<String>(
                        stream: bloc.password,
                        builder: (context, snapshot) {
                          return TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isVisible2,
                            decoration: InputDecoration(
                              hintText: "Enter the Password",
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              suffixIcon: IconButton(
                                icon: isVisible2
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () {
                                  setState(
                                    () {
                                      isVisible2 = !isVisible2;
                                    },
                                  );
                                },
                              ),
                            ),
                            onChanged: (value) {
                              bloc.password;
                              // return print(value);
                            },
                          );
                        }),
                    const SizedBox(height: 30.0),
                    StreamBuilder<String>(
                        stream: bloc.confirmPassword,
                        builder: (context, snapshot) {
                          return TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isVisible,
                            decoration: InputDecoration(
                              hintText: "Enter the Confirm Password",
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              suffixIcon: IconButton(
                                icon: isVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () {
                                  setState(
                                    () {
                                      isVisible = !isVisible;
                                    },
                                  );
                                },
                              ),
                            ),
                            onChanged: (value) {
                              bloc.confirmPassword;
                              // return print(value);
                            },
                          );
                        }),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(200.0, 50.0),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          const WidgetSpan(
                            child: SizedBox(width: 5.0),
                          ),
                          TextSpan(
                            text: "Login here",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                /// Navigate to Registration screen
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ),
                                );
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
      ),
    );
  }
}
