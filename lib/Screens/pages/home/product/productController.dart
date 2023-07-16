import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductController extends GetxController {
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('products');

  final RxList<Map<String, dynamic>> _products = <Map<String, dynamic>>[].obs;

  List<Map<String, dynamic>> get products => _products.toList();
  Rx<bool> isLoading = true.obs;
  @override
 

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final querySnapshot = await _productsCollection.get();
      final List<Map<String, dynamic>> productList = [];

      for (var doc in querySnapshot.docs) {
        final product = doc.data() as Map<String, dynamic>;
        productList.add(product);
        isLoading=false.obs;
        update();
      }
      

      _products.value = productList;
      isLoading=false.obs;
      update();
    } catch (error) {
      // Handle the error
      print('Error fetching products: $error');
    }
  }
}
