import 'package:englishessay/components/RoundedButton.dart';
import 'package:englishessay/components/alreadyHaveAccountCheck.dart';
import 'package:englishessay/components/roundedInputField.dart';
import 'package:englishessay/components/roundedPasswordField.dart';
import 'package:englishessay/services/dialogBox.dart';
import 'package:englishessay/services/userLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flushbar/flushbar.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  UserLogin userLogin = new UserLogin();
  TextEditingController userNameController,emailController,passwordController,cpasswordController;
  String errorText;
  String errorTitle;
  FocusNode userNameFocues= new FocusNode();
 FocusNode emailFocues= new FocusNode();
 FocusNode passwordFocues= new FocusNode();
 FocusNode cpasswordFocues = new FocusNode();
 bool isLoading = false;

  @override
  void initState() {
    userNameController = new TextEditingController();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    cpasswordController = new TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cpasswordController.dispose();
    userNameFocues.dispose();
    emailFocues.dispose();
    passwordFocues.dispose();
    cpasswordFocues.dispose();
    super.dispose();
  }

  void checkEmptyField(){
    if(userNameController.text.isEmpty){
      errorText="Username Field is empty"; 
    }else if(emailController.text.isEmpty){
errorText="Email Field is empty";
    }
    else if(passwordController.text.isEmpty){
errorText="Password Field is empty";
    }
    else if(cpasswordController.text.isEmpty){
errorText="Confirm Password Field is empty";
    }else if(passwordController.text !=cpasswordController.text){
      errorText="Passwords Do not Match";
    }else{
      errorText="noError";
    }
  }

  bool isValidEmail(String email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }

  Future<void> regUser(BuildContext context) async {
    Map data = {
      "action": "register",
      "userName": userNameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "cpassword": cpasswordController.text
    };
    await userLogin.registerUser(data,context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,left: 0,child: 
              Image.asset("assets/images/signup_top.png",width: size.width*0.35,))
              ,isLoading?Center(child: CircularProgressIndicator(),):Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("SIGN UP",style: TextStyle(fontWeight: FontWeight.bold),),
                  SvgPicture.asset("assets/icons/signup.svg",height: size.height*0.35,),
                  RoundedInputField(hintText: "Enter UserName", icon: Icons.person, controller: userNameController,nextNode: emailFocues,),
                  RoundedInputField(hintText: "Enter email", icon: Icons.email, controller: emailController,node: emailFocues,nextNode: passwordFocues,),
                  RoundedPasswordField(hintText: "Enter password", icon: Icons.lock_outline, controller: passwordController,isLastField: false,nextNode: cpasswordFocues,node: passwordFocues,),
                  RoundedPasswordField(hintText: "Confirm password", icon: Icons.lock, controller: cpasswordController,isLastField: true,node: cpasswordFocues,),
                  RoundedButton(press: ()async{
                    
                    checkEmptyField();
                    setState(() {
                      isLoading = true;
                    });
                    if(errorText=="noError"){
                      if(isValidEmail(emailController.text)){
                       await regUser(context);
                      }else{
                        AlertingData().showDialogBox(context, "Invalid Email", "Please enter a valid email to register");
                      }
                      
                    }else{
                      Flushbar(
                        message: errorText,
                        backgroundColor: Colors.red,
                        animationDuration:Duration(seconds: 1) ,
                        duration: Duration(seconds: 1),
                      )..show(context);
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },text: "Sign Up",),
                  AlreadyHaveAccountCheck(isLogin: false,press: (){
                    Navigator.pop(context);
                  },)
                  
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
