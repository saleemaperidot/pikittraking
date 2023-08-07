import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pikittraking/controllers/login_controller.dart';
import 'package:pikittraking/home.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKeylogin = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final LoginController _loginController = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Form(
            key: _formKeylogin,
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "LOGIN ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "Enter Email and Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 40,
                ),
                Text("Email"),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "Enter valid email"
                        : null;
                  },
                  style: TextStyle(),
                ),
                Text("Password"),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "Enter password"
                        : null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKeylogin.currentState!.validate()) {
                        _loginController.email = _emailController.text;

                        _loginController.password = _passwordController.text;

                        var result = await _loginController.login();
                        print("lllll$result");
                        if (result == "true") {
                          Get.off(() => Home());
                        } else {
                          Get.snackbar(
                            "cant Login",
                            "You are not registered",
                            icon: Icon(Icons.person, color: Colors.white),
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      }
                    },
                    child: Text("Login"))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
