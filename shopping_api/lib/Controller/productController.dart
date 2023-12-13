// ignore: file_names
import 'package:get/get.dart';
import 'package:shopping_api/Model/product_model.dart';
import 'package:shopping_api/Services/api_service.dart';

class ProductCOntroller extends GetxController {
  var productList = RxList<Product>();
  //RxList<Product> productList = <Product>[].obs;
  var isloading = true.obs;
  fetchproduct() async {
    try {
      isloading(true);
      var productdata = await FetchProduct().fetchdata();
      productList.addAll(productdata);
    } catch (e) {
      print("error fatch $e");
    } finally {
      isloading(false);
    }
  }

  @override
  void onInit() {
    fetchproduct();
    super.onInit();
  }
}
