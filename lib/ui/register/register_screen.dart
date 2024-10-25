import 'package:flutter/material.dart';
import 'package:todo/style/constants.dart';
import 'package:todo/style/reusable_component/CustomButton.dart';
import 'package:todo/style/reusable_component/CustomFormField.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "register";
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          title: Text("Create Account"),
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
                        label: "Full Name",
                        keyboard: TextInputType.name,
                      controller: fullNameController,
                      validate: (value) {
                        if(value == null || value.isEmpty){
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height*0.01,
                    ),
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
                      height: height*0.01,
                    ),
                    CustomFormField(label: "Password Confirmation",
                      keyboard: TextInputType.visiblePassword,
                      controller: passwordConfirmationController,
                      isPassword: true,
                      validate: (value){
                        if(value != passwordController.text){
                          return "Should be same as password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height*0.05,
                    ),
                    CustomButton(label: "Create Account",onClick: (){
                      createAccount();
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


  createAccount(){
   if( formKey.currentState?.validate() == true){ // create new account


   }

  }
}
