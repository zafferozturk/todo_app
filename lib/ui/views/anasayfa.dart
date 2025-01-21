import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/yapilacaklar.dart';
import 'package:to_do_app/ui/cubit/anasayfa_cubit.dart';
import 'package:to_do_app/ui/views/detay_guncelle.dart';
import 'package:to_do_app/ui/views/detay_sayfa.dart';
import 'package:to_do_app/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().gorevleriYukle();
  }
  bool aramaYapiliyorMu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaKelimesi){
            context.read<AnasayfaCubit>().ara(aramaKelimesi);
            },
        ) :
        const Text("Yapılacaklar"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
            context.read<AnasayfaCubit>().gorevleriYukle();
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Gorevler>>(
          builder: (context,gorevlerListesi){
            if(gorevlerListesi.isNotEmpty){
              return ListView.builder(
                itemCount: gorevlerListesi.length,
                itemBuilder: (context,indeks){
                  var gorev = gorevlerListesi[indeks];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(gorev: gorev)))
                          .then((value) {
                            context.read<AnasayfaCubit>().gorevleriYukle();
                      });
                      },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(gorev.gorev_ad),
                          trailing: IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: const Text("Görev silinsin mi?"),
                                  action: SnackBarAction(label: "Evet", onPressed: (){
                                    context.read<AnasayfaCubit>().sil(gorev.gorev_id);
                                  }),
                              )
                            );
                          }, icon: const  Icon(Icons.clear)),


                        ),
                      ),
                    ),
                  ),
                );

                },
              );



            }else{
              return const Center();
            }
          }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
            .then((value) {
              context.read<AnasayfaCubit>().gorevleriYukle();
        });
      },
        child: const Icon(Icons.add),
      ),

    );
  }
}
