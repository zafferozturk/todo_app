import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/yapilacaklar.dart';
import 'package:to_do_app/data/repo/to_do_listdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Gorevler>> {
  AnasayfaCubit():super(<Gorevler>[]);
  var grepo = GorevlerDaoRepository();

  Future<void> gorevleriYukle() async {
    var liste = await grepo.gorevleriYukle();
    emit(liste);
  }

  Future<void> sil(int gorev_id) async {
    await grepo.sil(gorev_id);
    await gorevleriYukle();
  }

  Future<void> ara (String aramaKelimesi) async {
    var liste = await grepo.ara(aramaKelimesi);
    emit(liste);
  }




}