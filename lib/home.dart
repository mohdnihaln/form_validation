import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
   Home({super.key});

TextEditingController usernameTXT = TextEditingController();
TextEditingController passwordTXT = TextEditingController();
TextEditingController confirmpasswordTXT = TextEditingController();

  final formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign UP", style: TextStyle(color: Colors.blueGrey, fontSize: 30, fontWeight: FontWeight.w600)),
              Text("Enter your username", style: TextStyle(color: Colors.blueGrey.withOpacity(.5))),
              spacing(),
              mytextform(hintText: "@gmail.com", labelText: "Username",controller: usernameTXT, validation: myValidations),
              spacing(),
              mytextform(hintText: "*****", labelText: "Password",controller: passwordTXT, validation: myValidation),
              spacing(),
              mytextform(hintText: "*****", labelText: "Confirm Password",controller: confirmpasswordTXT, validation: myValidation),
              spacing(),
              Align(
                alignment: Alignment.center,
                child: SizedBox(width: double.infinity, child: CupertinoButton.filled(child: Text("Sign UP"), onPressed: () => onButtonPressed(context))))
              ],
          ),
        ),
      ),
    );
  }

  void onButtonPressed(context){

    if (formkey.currentState!.validate()) {

      if(passwordTXT.text == confirmpasswordTXT.text){
      
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("user ${usernameTXT.text} with password ${passwordTXT.text} and confirmed with ${confirmpasswordTXT.text}")),
      );

      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password doesnt match")));
      }

    }
    
    }

  TextFormField mytextform({required String hintText, required String labelText, required TextEditingController controller, required Function validation}) {
    return TextFormField(

      validator: (v) => validation(v),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(width: 5.0)),
        hintText: hintText, labelText: labelText),);
  }

String? myValidation(value){ 
  if(value == null || value.isEmpty || value.length < 8 ){
          return "please enter the details. Minimum 8 letters. ";
        }
        return null;
      }
String? myValidations(value){ 
  if(value == null || value.isEmpty ){
          return "please enter the details";
        }
        return null;
      }

  SizedBox spacing(){
    return SizedBox(height: 16,);
  }
}