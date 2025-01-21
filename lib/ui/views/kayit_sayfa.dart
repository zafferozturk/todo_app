import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfGorevAdi = TextEditingController();
  var tfGorevDetay = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Görev Ekle"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: tfGorevAdi,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                    labelText: "Görev Adı",
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: tfGorevDetay,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                    labelText: "Görev Detayları",
                    contentPadding: const EdgeInsets.all(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: (){
                context.read<KayitSayfaCubit>().kaydet(tfGorevAdi.text, tfGorevDetay.text);
              },
                  child: const Text("KAYDET",
                  style: const TextStyle(fontSize: 30),)),
            ],
          ),
        ),
      ),
    );
  }
}
