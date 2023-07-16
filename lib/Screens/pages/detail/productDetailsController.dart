import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Constants/firebase_constants.dart';

class detailController extends GetxController {
  Rx<int> counter = 1.obs;

  increment() {
    counter.value++;
    update();
  }

  decrement() {
    if (counter.value > 1) {
      counter.value--;
    }

    update();
  }

  addToCart(var product, int quantity) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('cart')
        .add({'product': product, 'quantity': quantity}).whenComplete(() => Get.snackbar("Done", "Item added to Cart"));
  }
}
