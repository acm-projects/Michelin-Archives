// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//import 'package:michelin_archives/auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//NEW IMPORT!!!! (allows easy overlap of widgets)
//ALSO NEEDS TO DOWNLOAD A LIBRARY
//run this in the flutter terminal first --> 'flutter pub add assorted_layout_widgets'
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  /*Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text, 
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
*/

  ///TEMPORARY FUNCTION CREATED TO MAKE IT WORK
  Future<void> tempFunction() async {
    errorMessage = "hello";
  }

//Not necessary as we do not have an app bar
/*  Widget _title() {
    return const Text('Michelin Archives');
  }
*/

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
                color: Color(0xFF351E0A),
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
          color: Color(0xFF351E0A),
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
          isLogin = !isLogin;
        });
      },
      child: Text(
        'Create an Account',
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Color(0xFF351E0A),
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
          color: Color(0xFF351E0A),
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
            backgroundColor: MaterialStateProperty.all(Color(0xFF351E0A)),
          ),
          onPressed: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: Text(
            'Login!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(255, 246, 239, 1),
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
            image: AssetImage('images/brown_pattern.png'),
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
                image: AssetImage("images/brown_title.png"),
                fit: BoxFit.cover)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFBC9573),
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
