// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:michelin_archives/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//NEW IMPORT!!!! (allows easy overlap of widgets)
//ALSO NEEDS TO DOWNLOAD A LIBRARY
//run this in the flutter terminal first --> 'flutter pub add assorted_layout_widgets'
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:michelin_archives/pages/recipe_doc.dart';
import 'package:oviya_pages/mainOv.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpState();
}

//void _navigateToHome(BuildContext context) {
//     Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => HomePage())); ////CHANGE PAGE
//   }

class _SignUpState extends State<SignUpPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  void _navigateToLogin(BuildContext context) {
    if (isLogin) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  Future<void> signInOrCreateUserWithEmailAndPassword() async {
    try {
      if (isLogin) {
        await Auth().signInWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
      } else {
        await Auth().createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLogin = false;
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFFFF6EF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelStyle: TextStyle(
                color: Color.fromARGB(255, 61, 68, 65),
                fontSize: 14,
                fontFamily: 'Georgia',
                fontWeight: FontWeight.w500,
                height: 0),
            labelText: title,
          ),
        ),
      ),
    );
  }

  Widget _erroMessage() {
    return Text(
      errorMessage == '' ? '' : 'Hmmm ? $errorMessage',
      textAlign: TextAlign.start,
      style: TextStyle(
          color: Color.fromARGB(255, 61, 68, 65),
          fontSize: 16,
          fontFamily: 'Georgia',
          fontWeight: FontWeight.w500,
          height: 0),
    );
  }

  Widget _loginButton() {
    return TextButton(
      onPressed: () {
            setState(() {
              isLogin ? _navigateToLogin(context) : null;
            });
          },
      child: Text(
        'Already Have An Account?',
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Color(0x00000000),
            fontSize: 16,
            fontFamily: 'Georgia',
            fontWeight: FontWeight.w500,
            height: 0),
      ),
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        width: 157,
        height: 56,
        decoration: ShapeDecoration(
          color: Color.fromARGB(255, 170, 185, 119),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 170, 185, 119)),
          ),
          onPressed: () {
            setState(() {
              isLogin ? _navigateToLogin(context) : null;
            });
          },
          child: Text(
            'Login!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 24,
                fontFamily: 'Georgia',
                fontWeight: FontWeight.w500,
                height: 0),
          ),
        ),
      ),
    );
  }

  Widget colorBlock() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: 353,
        height: 322,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage('images/green_pattern.png'),
            fit: BoxFit.cover,
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                child: _entryField('Email', _controllerEmail),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: _entryField('Password', _controllerPassword),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerImageLogin() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 150, 10, 25),
      child: Container(
        width: 350,
        height: 131.25,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/green_title.png"),
                fit: BoxFit.cover)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 204, 213, 174),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              headerImageLogin(),
              ColumnSuper(
                children: [colorBlock(), _submitButton()],
                innerDistance: -35.0,
              ),
              _loginButton(),
              _erroMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
