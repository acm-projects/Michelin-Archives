import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:michelin_archives/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Michelin Archives');
  }

  Widget _userUID() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(188, 149, 115, 1),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 10.0),
          child: GNav(
            backgroundColor: Color.fromRGBO(188, 149, 115, 1),
            color: Colors.black87,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.brown,
            gap: 8,
            padding: EdgeInsets.all(15),
            tabs: [
              GButton(
                iconSize: 30,
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                iconSize: 30,
                icon: Icons.folder_copy_rounded,
                text: 'Recipes',
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUID(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
