import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/to_do_listdao_repository.dart';

class GuncelleSayfaCubit extends Cubit<void> {
  GuncelleSayfaCubit():super(0);

  var grepo = GorevlerDaoRepository();


  Future<void> guncelle(int gorev_id, String gorev_ad, String gorev_detay) async {
    await grepo.guncelle(gorev_id, gorev_ad, gorev_detay);
  }

}