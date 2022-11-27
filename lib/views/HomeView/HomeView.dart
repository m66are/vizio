import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vizio/controllers/AuthController.dart';
import 'package:vizio/controllers/DataController.dart';
import 'package:vizio/helpers/context_helper.dart';
import 'package:vizio/routes/routes.dart';
import 'package:vizio/widgets/MainButton.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AuthController authController = Get.find<AuthController>();
  DataController dataController = Get.find<DataController>();
  final form = FormGroup({
    'salle': FormControl<int>(value: 0),
  });
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Vizio"),
          actions: [
            IconButton(
                onPressed: () async {
                  await authController.signOut();
                  context.nav.pushReplacementNamed(kWrapper);
                },
                color: Colors.white,
                icon: const Icon(Icons.logout))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          DateFormat("dd/MMMM/yyyy")
                              .format(DateTime.now())
                              .toString(),
                          style: Get.textTheme.bodyText1,
                        )
                      ],
                    )),
              ),
              Card(
                child: Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          DateFormat("hh:mm ")
                              .format(DateTime.now())
                              .toString(),
                          style: Get.textTheme.bodyText1,
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Nomber de salle",
                style: Get.textTheme.bodyText1,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  child: DropdownButtonFormField<int>(
                decoration: _dropDownDecoration(label: "minutes"),
                value: dataController.salle.value,
                isExpanded: false,
                onChanged: (v) {},
                items: List.generate(20, (index) => index + 1)
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        value.toString(),
                        style: Get.textTheme.bodyText1,
                      ));
                }).toList(),
              )),
              const SizedBox(
                height: 35,
              ),
              MainButton(
                label: "Voir les données",
                onClick: () async {
                  context.nav.pushNamed(kInfo);
                },
              )
            ],
          ),
        ));
  }

  InputDecoration _dropDownDecoration(
      {required String label, Widget? prefixIcon}) {
    return InputDecoration(
      filled: true,
      isDense: false,
      fillColor: Colors.white,
      prefixIcon: prefixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      label: Text(label),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }
}
