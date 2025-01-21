import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/yapilacaklar.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/ui/cubit/guncelle_sayfa_cubit.dart';

class DetayGuncelle extends StatefulWidget {
  Gorevler gorev;


  DetayGuncelle({required this.gorev});

  @override
  State<DetayGuncelle> createState() => _DetayGuncelleState();
}

class _DetayGuncelleState extends State<DetayGuncelle> {
  var tfGorevAdi = TextEditingController();
  var tfGorevDetay = TextEditingController();

  @override
  void initState() {
    super.initState();
    var gorev = widget.gorev;
    tfGorevAdi.text = gorev.gorev_ad;
    tfGorevDetay.text = gorev.gorev_detay;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Görev Detayları"),
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: tfGorevAdi,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: widget.gorev.gorev_ad,
                    labelText: "Görev Adı",
                    contentPadding: const EdgeInsets.all(20),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: tfGorevDetay,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: widget.gorev.gorev_detay,
                    labelText: "Görev Detayları",
                    contentPadding: const EdgeInsets.all(40),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              context.read<GuncelleSayfaCubit>().guncelle(widget.gorev.gorev_id, tfGorevAdi.text, tfGorevDetay.text);
              }, child: const Text("GÜNCELLE")),
          ],
        ),
      ),
    );
  }
}
