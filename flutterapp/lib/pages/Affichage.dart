
import 'Ajout.dart';

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class Affichage extends StatefulWidget {
  const Affichage({Key? key}) : super(key: key);

  @override
  State<Affichage> createState() => _AffichageState();
}

class _AffichageState extends State<Affichage> {
  bool isAPIcallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  
  
  Widget image1(String img){
    return Container(
      height: 200,
      width: 400,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        child: Image(
          fit: BoxFit.fill,
          image: NetworkImage(img),
          ),
      ),
    );
  }

  Widget text1(String info, String sub){
    return Container(
      height: 200,
      width: 400,
      child: Column(
        children: [
          Text(info, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.deepPurple), textAlign: TextAlign.center,),
          const Padding(padding: EdgeInsets.only(top: 10),),
          Text(sub, style: const TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.center,),
      ]),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Padding(
            padding: EdgeInsets.only(left: 90),
            child: Text('Accueil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white),),
          ),
        ),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _affiche(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }
  
  Widget _affiche(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        const Padding(padding: EdgeInsets.all(15)),
        Center(
          
          child: FormHelper.submitButton("Réservation", (){
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const Ajout())
            );
          },),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            child: Material(
              color: Colors.white,
              elevation: 10.0,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(35),
              child: FittedBox(
                child: Column(
                  children: [
                    image1("https://cdn-s-www.republicain-lorrain.fr/images/6E0B26D9-BF09-4606-A970-3B104AADC61F/NW_listC/barrages-de-montee-en-d2-amneville-peut-nourrir-des-regrets-1655050243.jpg"),
                    text1("Barrages de montée en D2 : Amnéville peut nourrir des regrets", "Battues à l’aller comme au retour par Lorient, les Amnévilloises ont raté le coche. La montée en Division 2 attendra pour les joueuses d’Endy Josephau."),
                    SizedBox(height: 10, child: Container(width: 390, color: Colors.redAccent,),),
                    const Padding(padding: EdgeInsets.all(5),),
                    image1("https://cdn-s-www.republicain-lorrain.fr/images/497B0741-8E25-4A6B-B894-E030C6E4E42F/NW_listA/district-revivez-en-images-les-finales-des-coupes-de-moselle-jeunes-1655130127.jpg"),
                    text1("District : revivez en images les finales des Coupes de Moselle jeunes", "Les Coupes de Moselle jeunes ont trouvé leur épilogue ce week-end. En U15, c'est le FC Sarrebourg qui l'a emporté (2-2, 7 TAB ) contre Merlebach..."),
                    SizedBox(height: 10, child: Container(width: 390, color: Colors.redAccent,),),
                    const Padding(padding: EdgeInsets.all(5),),
                    image1("https://cdn-s-www.republicain-lorrain.fr/images/8446F3DC-E383-4E08-84E7-EED86D974C9A/NW_listB/marly-en-nationale-2-c-etait-dur-intense-en-emotion-1655114355.jpg"),
                    text1("Marly en Nationale 2 féminine : « C’était dur, intense en émotion »", "Première de la poule 1 de N3 (avec seize victoires pour un nul et une défaite), l’équipe de Marly a validé son accession en N2 après des play-off victorieux. P2H, battu en finale, monte également. Les explications de l’arrière de Marly, Anne Lemarquis."),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
