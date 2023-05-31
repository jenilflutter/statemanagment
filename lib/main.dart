import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: Homepage(),
  ));
}

class Homepage extends StatelessWidget {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Mygetx mygetx = Get.put(Mygetx());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: t1,
              ),
              TextField(
                controller: t2,
              ),
              ElevatedButton(
                  onPressed: () {
                    mygetx.Sumvalue(t1.text, t2.text);

                    // Get.to(SecondPage(),
                    //     transition: Transition.downToUp,
                    //     duration: Duration(seconds: 2));
                    // Get.snackbar("title", "message");
                  },
                  child: Text("Go to Anther")),
              Obx(() => Text("=Sum==${mygetx.sum.value}"))
            ],
          ),
        ),
      ),
    );
  }
}

class Mygetx extends GetxController {
  RxString sum = "".obs;
  double a = 0;
  double b = 0;

  void Sumvalue(String t1, String t2) {
    if (t1.isNotEmpty) {
      a = double.tryParse(t1)!;
    } else {
      a = 0;
    }
    if (t2.isNotEmpty) {
      b = double.parse(t2);
    } else {
      b = 0;
    }
    double c = a + b;
    sum.value = c.toString();
  }


}
