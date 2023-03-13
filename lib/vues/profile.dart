import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userID = '';
  String userMail = '';
  String userPassword = '';
  String userBirthday = '';
  String userAddress = '';
  String userPostcode = '';
  String userCity = '';

  
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
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
      userCity = data['city'];
    });
  }

  @override
  Widget build(BuildContext context) {
    //final mailController = TextEditingController(text: userMail);
    final passwordController = TextEditingController(text:  userPassword);
    final birthdayController = TextEditingController(text: userBirthday);
    final addressController = TextEditingController(text: userAddress);
    final postcodeController = TextEditingController(text: userPostcode);
    final cityController = TextEditingController(text: userCity);

    final mail = Text(
      userMail,
      style: const TextStyle( fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center
    );
    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Mot de passe',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final birthday = TextFormField(
      controller: birthdayController,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Date de naissance',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final address = TextFormField(
      controller: addressController,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Adresse',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final postcode = TextFormField(
      controller: postcodeController,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Code postal',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final city = TextFormField(
      controller: cityController,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Ville',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      ),
    );

    final saveButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: Colors.lightBlueAccent,
          padding: const EdgeInsets.all(12),
        ),
        onPressed: () async {
          await FirebaseFirestore.instance
              .collection('users')
              .doc('user1')
              .update({
            'password': passwordController.text,
            'birthday': birthdayController.text,
            'address': addressController.text,
            'postcode': postcodeController.text,
            'city': cityController.text,

          }).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Modification(s) enregistrée(s)'),
                ),
              );
          });
          
        },
        child: const Text('Enregistrer', style: TextStyle(color: Colors.white)),
      ),
      
    );

    final deconnection = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child :  ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: Colors.lightBlueAccent,
          padding: const EdgeInsets.all(12),
        ),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        },
        child: const Text('Déconnexion', style: TextStyle(color: Colors.white)),
      )
    );

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        const SizedBox(height: 48.0),
        mail,
        const SizedBox(height: 8.0),
        password,
        const SizedBox(height: 8.0),
        birthday,
        const SizedBox(height: 8.0),
        address,
        const SizedBox(height: 8.0),
        postcode,
        const SizedBox(height: 8.0),
        city,
        const SizedBox(height: 24.0),
        saveButton,
        deconnection
      ],
    );
  }
}
