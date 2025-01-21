import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/to_do_listdao_repository.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit():super(0);

  var grepo = GorevlerDaoRepository();

  Future<void> kaydet(String gorev_ad, String gorev_detay) async {
    await grepo.kaydet(gorev_ad, gorev_detay);
  }

}