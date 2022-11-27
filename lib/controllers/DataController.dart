import 'package:fireauth/controllers/db_controller.dart';
import 'package:get/state_manager.dart';

class DataController extends GetxController {
  final DatabaseService _databaseService = DatabaseService(
      databaseUrl: "https://vizio-5bff3-default-rtdb.firebaseio.com/");
  RxInt salle = RxInt(1);
  RxMap details = RxMap({});
  RxInt stats = RxInt(0);
  RxInt nonstats = RxInt(0);
  RxInt cons = RxInt(0);
  RxInt noncons = RxInt(0);
  RxInt happy = RxInt(0);
  RxInt angry = RxInt(0);
  RxInt tired = RxInt(0);
  @override
  void onInit() async {
    // TODO: implement onInit

    await _databaseService.getData(nodePath: "/sats/non").then((value) {
      print("${value.data}");
      nonstats.value = value.data;
    });
    await _databaseService.getData(nodePath: "/sats/satisfait").then((value) {
      stats.value = value.data;
    });
    await _databaseService.getData(nodePath: "/data/Angry").then((value) {
      angry.value = value.data;
    });
    await _databaseService.getData(nodePath: "/data/happy").then((value) {
      happy.value = value.data;
    });
    await _databaseService.getData(nodePath: "/data/tired").then((value) {
      tired.value = value.data;
    });
    await _databaseService.getData(nodePath: "/cons/concentrées").then((value) {
      cons.value = value.data;
    });
    await _databaseService.getData(nodePath: "/cons/perturbées").then((value) {
      noncons.value = value.data;
    });

    super.onInit();
  }
}
