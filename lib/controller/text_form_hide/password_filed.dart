import 'package:get/get.dart';

class PasswordField extends GetxController {
  var isObscurefirst = true.obs;
   var isObscureSecond = true.obs;
  void toggleObscureFirst() {
     isObscurefirst.value = !isObscurefirst.value;
     update();
  }
    void toggleObscureSecond() {
     isObscureSecond.value = !isObscureSecond.value;
     update();
  }
  
}