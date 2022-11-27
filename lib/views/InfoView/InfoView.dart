import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizio/constants/colors.dart';
import 'package:vizio/controllers/DataController.dart';

class InfoView extends StatefulWidget {
  const InfoView({
    super.key,
  });

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  DataController dataController = Get.find<DataController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Informations")),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      "Angry : ${dataController.angry.value} ",
                      style: Get.textTheme.bodyText1,
                    )),
              ),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      "happy : ${dataController.happy.value} ",
                      style: Get.textTheme.bodyText1,
                    )),
              ),
              Card(
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      "Tired : ${dataController.tired.value} ",
                      style: Get.textTheme.bodyText1,
                    )),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(16),
                        child: Text(
                          "Concentrées : ${dataController.cons.value} ",
                          style: Get.textTheme.bodyText1,
                        )),
                  ),
                  Card(
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(16),
                        child: Text(
                          "Perturbées : ${dataController.noncons.value} ",
                          style: Get.textTheme.bodyText1,
                        )),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.green.shade200,
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      "Satisfait : ${dataController.stats.value} ",
                      style: Get.textTheme.headline3,
                    )),
              ),
              Card(
                color: Colors.red.shade200,
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      "Non satisfait : ${dataController.nonstats.value} ",
                      style: Get.textTheme.headline3,
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    gradient: gGreenBrown,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "Taux de réussite de cours :",
                          style: Get.textTheme.bodyText2
                              ?.copyWith(color: Colors.white),
                        )),
                    Text(
                      "${((dataController.stats.value / 18) * 100).round()} %",
                      style: Get.textTheme.headline2?.copyWith(color: cGreen),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
