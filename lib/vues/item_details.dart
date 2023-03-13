import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../classes_definition/article.dart';

class ItemDetails extends StatefulWidget {
  var id = "";

  ItemDetails({super.key, required this.id});


  @override
  State<ItemDetails> createState() => _ItemDetailsState(id);
}

class _ItemDetailsState extends State<ItemDetails> {
  Article article = Article("", "", "", 0, "", "", "");
  List<Article> articles = [];
  String itemID = "";

  Future<Article> getArticles(String id) async {
    Article article = Article("", "", "", 0, "", "", "");
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('articles');
    await collectionReference.doc(id).get().then((value) {
      article = Article(value["nom"], value["marque"], value["image"],
          value["prix"], value["taille"], value["type"], id);
    });
    return article;
  }

  _ItemDetailsState(String id) {
    getArticles(id).then((value) {
      setState(() {
        article = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final addToCart = Padding(
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
          CollectionReference collectionReference = FirebaseFirestore.instance.collection('panier');
          await collectionReference.add({
            "nom": article.nom,
            "marque": article.marque,
            "image": article.image,
            "prix": article.prix,
            "taille": article.taille,
            "type": article.type,

          });
          Navigator.pop(context);
        },
        child: const Text('Ajouter au panier'),
      ),
    );

    final removeToCart = Padding(
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
          CollectionReference collectionReference = FirebaseFirestore.instance.collection('panier');
          await collectionReference.doc(article.id).delete();
        },
        child: const Text('Supprimer du panier'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails"),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          Image.network(article.image, height: 600, fit: BoxFit.cover),
          Text(article.nom, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35), textAlign: TextAlign.center),
          Text(article.marque, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
          Text('${article.prix.toString()}€', style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
          Text('Taile : ${article.taille}', style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
          Text(article.type, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
          if (article.id != "") addToCart else removeToCart,      
        ],
      ),
      
    );
  }
}
