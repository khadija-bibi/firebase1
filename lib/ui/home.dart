import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
final controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: (
                InputDecoration(
                  hintText: ("Enter your name"),
                  border: OutlineInputBorder(),

                )
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                final name=controller.text;
                createUser(name:name);

              },
            child: Text(
              'Enter '
            ),
            ),
          ],
        ),
      ),

    );
  }

  Future createUser({required String name})async {
    final docUser=FirebaseFirestore.instance.collection('users').doc("myid");
  final json={
    'name':name,
  };
  await docUser.set(json);
  }
}
