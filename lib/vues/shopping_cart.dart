import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../classes_definition/article.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  List<Article> panier = [];
  double sum = 0;
  
  
  @override
  void initState() {
    super.initState();
    getPanier().then((value) {
      setState(() {
        panier = value;
      });
    });
  }

  Future<List<Article>> getPanier() async {
    List<Article> articles = [];
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('panier');
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var doc in querySnapshot.docs) {
      articles.add(Article(doc["nom"], doc["marque"], doc["image"], doc["prix"],
          doc["taille"], doc["type"], doc.reference.id));
    }
    return articles;
  }

  double getTotal() {
    double total = 0;
    for (var article in panier) {
      total += article.prix;
    }
    return total;
  }

  double getNbArticles() {
    double nbArticles = 0;
    for (var article in panier) {
      nbArticles += 1;
    }
    return nbArticles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Nombre d'articles: ${getNbArticles()}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          for (var article in panier)
            ListTile(
              title: Text(article.nom),
              subtitle: Text(article.marque),
              leading: Image.network(article.image),
              trailing: Text('${article.prix.toString()}€'),
            ),
          Text("Total: ${getTotal()}€", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
          
        ],
      )
        //itemCount: panier.length,
        //itemBuilder: (context, index) {
        //   return ListTile(
        //     title: Text(panier[index].nom),
        //     subtitle: Text(panier[index].marque),
        //     leading: Image.network(panier[index].image),
        //     trailing: Text(panier[index].prix.toString()),
        //   );
        // },
      //)
    );
  }
}

