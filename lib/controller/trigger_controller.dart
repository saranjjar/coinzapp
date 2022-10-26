
import 'package:coinz/Api/Repo/trigger_repo.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/trigger_model.dart';

class TriggerxController extends GetxController {
  List<TTrigger> listTrigger = [];
  bool isLoadingRequest = false;

  getTrigger() async {
    isLoadingRequest = true;
    update();

      listTrigger =
      await TriggerRepo.instance.getTriggerRequest();
      isLoadingRequest = false;
      update();
    }

  @override
  void onInit() {
    getTrigger();
    super.onInit();
  }
}
