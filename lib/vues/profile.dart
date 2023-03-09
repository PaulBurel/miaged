import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../classes_definition/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'editProfile.dart';

final storage = new FlutterSecureStorage();
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // User user = User("", "", "", "", "", "");

  // Future<User> getUser() async{
  //   User user = User("", "", "", "", "", "");
  //   CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
  //   await collectionReference.doc(user.mail).get().then((value) {
  //     user = User(value["nom"], value["prenom"], value["email"], value["password"], value["adresse"], value["telephone"]);
  //   });
  //   return user;
  // }

  // ProfileState() {
  //   getUser().then((value) {
  //     setState(() {
  //       user = value;
  //     });
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   final mailController = TextEditingController(text: user.mail);
  //   final passwordController = TextEditingController(text: user.password);
  //   final birthdayController = TextEditingController(text: user.birthday);
  //   final addressController = TextEditingController(text: user.address);
  //   final postcodeController = TextEditingController(text: user.postcode);
  //   final cityController = TextEditingController(text: user.city);

  //   final mail = TextFormField(
  //     controller: mailController,
  //     keyboardType: TextInputType.emailAddress,
  //     autofocus: false,
  //     decoration: const InputDecoration(
  //       hintText: 'Email',
  //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  //       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  //     ),
  //   );

  //   final password = TextFormField(
  //     controller: passwordController,
  //     autofocus: false,
  //     obscureText: true,
  //     decoration: const InputDecoration(
  //       hintText: 'Mot de passe',
  //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  //       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  //     ),
  //   );

  //   final birthday = TextFormField(
  //     controller: birthdayController,
  //     autofocus: false,
  //     decoration: const InputDecoration(
  //       hintText: 'Date de naissance',
  //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  //       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  //     ),
  //   );

  //   final address = TextFormField(
  //     controller: addressController,
  //     autofocus: false,
  //     decoration: const InputDecoration(
  //       hintText: 'Adresse',
  //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  //       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  //     ),
  //   );

  //   final postcode = TextFormField(
  //     controller: postcodeController,
  //     autofocus: false,
  //     decoration: const InputDecoration(
  //       hintText: 'Code postal',
  //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  //       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  //     ),
  //   );

  //   final city = TextFormField(
  //     controller: cityController,
  //     autofocus: false,
  //     decoration: const InputDecoration(
  //       hintText: 'Ville',
  //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  //       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  //     ),
  //   );

  //   final saveButton = Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 16.0),
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(24),
  //         ),
  //         backgroundColor: Colors.lightBlueAccent,
  //         padding: const EdgeInsets.all(12),
  //       ),
  //       onPressed: () async {
  //         await FirebaseFirestore.instance
  //             .collection('users')
  //             .doc(user.mail)
  //             .update({
  //           'password': passwordController.text,
  //           'birthday': birthdayController.text,
  //           'address': addressController.text,
  //           'postcode': postcodeController.text,
  //           'city': cityController.text,
  //         });
  //       },
  //       child: const Text('Enregistrer', style: TextStyle(color: Colors.white)),
  //     ),
  //   );

  //   return ListView(
  //     shrinkWrap: true,
  //     padding: const EdgeInsets.only(left: 24.0, right: 24.0),
  //     children: <Widget>[
  //       const SizedBox(height: 48.0),
  //       mail,
  //       const SizedBox(height: 8.0),
  //       password,
  //       const SizedBox(height: 8.0),
  //       birthday,
  //       const SizedBox(height: 8.0),
  //       address,
  //       const SizedBox(height: 8.0),
  //       postcode,
  //       const SizedBox(height: 8.0),
  //       city,
  //       const SizedBox(height: 24.0),
  //       saveButton,
  //     ],
  //   );
  // }
  String userID = '';
  String userMail = '';
  String userPassword = '';
  String userBirthday = '';
  String userAddress = '';
  String userPostcode = '';

  
  @override
  void initState() {
    super.initState();
    getUserID();
  }

  void getUserID() async {
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc('user1').get();
    final data = snapshot.data() as Map<String, dynamic>;
    setState(() {
      //userID = snapshot.id;
      userID = data['id'];
      userMail = data['mail'];
      userPassword = data['password'];
      userBirthday = data['birthday'];
      userAddress = data['address'];
      userPostcode = data['postcode'];
    });
  }

  @override
  Widget build(BuildContext context) {

    final modifierInfos = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: Colors.lightBlueAccent,
          padding: const EdgeInsets.all(12),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => editProfile()),
          );
        },
        child: const Text('Modifer vos informations', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      body: ListView(
        children: [
          Text('User ID: $userID'),
          Text('User Mail: $userMail'),
          Text('User Password: $userPassword'),
          Text('User Birthday: $userBirthday'),
          Text('User Address: $userAddress'),
          Text('User Postcode: $userPostcode'),
          modifierInfos,
        ],
      ),
    );
  }


  


}
