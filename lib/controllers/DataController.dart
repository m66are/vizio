import 'dart:async';

import 'package:fireauth/controllers/db_controller.dart';
import 'package:get/state_manager.dart';
import 'package:vizio/models/Feeling.dart';

class DataController extends GetxController {
  final DatabaseService _databaseService = DatabaseService(
      databaseUrl: "https://vizio-5bff3-default-rtdb.firebaseio.com/");

  RxList<Feeling> feelings = RxList.empty();
  RxInt salle = RxInt(1);
  RxMap details = RxMap({});
  RxInt stats = RxInt(0);
  RxInt nonstats = RxInt(0);
  RxInt cons = RxInt(0);
  RxInt noncons = RxInt(0);
  RxInt posSum = RxInt(0);
  RxInt negSum = RxInt(0);

  num get getPercentage {
    return ((posSum.value / (posSum.value + negSum.value)) * 100).round();
  }

  StreamSubscription? subscription;

  @override
  void onInit() async {
    // TODO: implement onInit
    _databaseService.getData(nodePath: "/all").then((value) {
      if (value.data != null) {
        feelings.clear();
        value.data.forEach((key, map) {
          feelings.add(Feeling.fromMap(map, key));
        });
      }
    });
    getPos();
    getNeg();
    _initStream();

    // await _databaseService.getData(nodePath: "/sats/non").then((value) {
    //   print("${value.data}");
    //   nonstats.value = value.data;
    // });
    // await _databaseService.getData(nodePath: "/sats/satisfait").then((value) {
    //   stats.value = value.data;
    // });
    // await _databaseService.getData(nodePath: "/data/Angry").then((value) {
    //   angry.value = value.data;
    // });
    // await _databaseService.getData(nodePath: "/data/happy").then((value) {
    //   happy.value = value.data;
    // });
    // await _databaseService.getData(nodePath: "/data/tired").then((value) {
    //   tired.value = value.data;
    // });
    // await _databaseService.getData(nodePath: "/cons/concentrées").then((value) {
    //   cons.value = value.data;
    // });
    // await _databaseService.getData(nodePath: "/cons/perturbées").then((value) {
    //   noncons.value = value.data;
    // });

    super.onInit();
  }

  void _initStream() {
    subscription = _databaseService
        .getDataAsStream(nodePath: "/all")
        .listen((dynamic event) {
      if (event.snapshot.value != null) {
        feelings.clear();
        event.snapshot.value.forEach((key, map) {
          feelings.add(Feeling.fromMap(map, key));
          getPos();
          getNeg();
        });
      }
    });
  }

  List<Feeling> getPos() {
    List<Feeling> posts = feelings.where((p0) => p0.isPositive).toList();
    for (var element in posts) {
      posSum.value += element.valeur.toInt();
    }
    return posts;
  }

  List<Feeling> getNeg() {
    List<Feeling> posts =
        feelings.where((p0) => p0.isPositive == false).toList();
    for (var element in posts) {
      negSum.value += element.valeur.toInt();
    }
    return posts;
  }
}
