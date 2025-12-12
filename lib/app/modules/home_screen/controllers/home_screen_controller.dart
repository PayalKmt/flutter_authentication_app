import 'package:get/get.dart';
import '../../../services/auth_service.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController

  final AuthService _authService = AuthService();
  final token = ''.obs;
  final phone = ''.obs;

  Future<void> fetchDetails() async {
    try {
      final authToken = await _authService.getAuthToken();
      final userPhone = await _authService.getPhoneNumber();

      if (authToken != null && userPhone != null) {
        token.value = authToken;
        phone.value = userPhone;

      } else {
        await logout();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load user details: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> logout() async {
    await _authService.clearAuthData();
    Get.snackbar("Logout", "Successfully", snackPosition: SnackPosition.BOTTOM);
    Get.offAllNamed('/login-screen');
  }

  @override
  Future<void> onInit() async{
    await fetchDetails();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
