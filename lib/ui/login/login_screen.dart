import 'package:flutter/material.dart';

import '../../style/constants.dart';
import '../../style/reusable_component/CustomButton.dart';
import '../../style/reusable_component/CustomFormField.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage(
              "assets/images/background.jpeg",
            ),
            fit: BoxFit.fill,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Login"),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFormField(
                      label: "Email Address",
                      keyboard: TextInputType.emailAddress,
                      controller: emailController,
                      validate: (value) {
                        if(value == null || value.isEmpty){
                          return "Please enter your email";
                        }
                        if(!isValideEmail(value)){
                          return "Please enter valid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height*0.01,
                    ),
                    CustomFormField(
                      label: "Password",
                      keyboard: TextInputType.visiblePassword,
                      controller: passwordController,
                      isPassword: true,
                      validate: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter your password";
                        }
                        if(value.length < 6){
                          return "Password should be at least 6 ";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height*0.05,
                    ),
                    CustomButton(label: "Login",onClick: (){
                      Login();

                    },),
                  ],
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }


  Login(){
    if(formKey.currentState!.validate()==true){

    }
  }
}
