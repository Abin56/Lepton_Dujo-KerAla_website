import 'package:get/get.dart';

import '../../model/tarif_purchase_model/tarif_purchase_model.dart';

class TarifController extends GetxController {
  RxString price = ''.obs;
  RxString maxstudents = ''.obs;
  RxString selectedPlan = ''.obs;
  RxInt extraFeature1Total = 4000.obs;
  RxInt extraFeature2Total = 3000.obs;
  RxList<TarifPurchaseModel> additionalFeatures = RxList.generate(
      2,
      (index) => TarifPurchaseModel(
          quantity: 0, totalamount: 0, product: '', price: ''));
  RxInt counnterIndex = 1.obs;
  RxInt counnterIndex1 = 1.obs;
  RxInt extraFeatureTotalPrice = 0.obs;

  // Future<void> gettarifDetail(String docid) async {
  //   var vari = await FirebaseFirestore.instance
  //       .collection("keralaSchoolTarif")
  //       .doc(docid)
  //       .get();
  //   price.value = vari.data()!['price'];
  // }
}
