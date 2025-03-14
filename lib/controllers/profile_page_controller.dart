import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProfilePageController extends GetxController {
  RxBool isRequestSent = F.obs;
  RxBool isLoading = F.obs;
  RxInt selectedIndex = 0.obs;
  var tabList = ["BADGES", "FRIENDS", "COURSES"];
}
