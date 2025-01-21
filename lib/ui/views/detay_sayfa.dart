import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/yapilacaklar.dart';
import 'package:to_do_app/ui/cubit/anasayfa_cubit.dart';
import 'package:to_do_app/ui/views/detay_guncelle.dart';

class DetaySayfa extends StatefulWidget {
  Gorevler gorev;


  DetaySayfa({required this.gorev});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GÖREV DETAYLARI"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Colors.white54,
              shape: const StadiumBorder(),
              child: SizedBox(
                height: 60,
                width: 200,
                child: Center(
                  child: Text(widget.gorev.gorev_ad, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                ),
              ),
            ),
            Card(
              color: Colors.white54,
              child: SizedBox(
                height: 280,
                width: 350,
                child: Center(
                  child: Text(widget.gorev.gorev_detay),
                ),
              ),
            ),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetayGuncelle(gorev: widget.gorev)));
                }, icon: Icon(Icons.edit, size: 40,)),
                IconButton(onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Görev silinsin mi?"),
                      action: SnackBarAction(label: "Evet", onPressed: (){
                        context.read<AnasayfaCubit>().sil(widget.gorev.gorev_id);
                      }),
                    ),
                  );
                }, icon: Icon(Icons.delete, size: 40,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
