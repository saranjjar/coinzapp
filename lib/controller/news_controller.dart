
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Api/Repo/news_repo.dart';
import '../model/news_model.dart';

class NewsxController extends GetxController {
  List<TNews> listNews = [];
  bool isLoadingRequest = false;

  getNews() async {
    isLoadingRequest = true;
    update();

    listNews =
    await NewsRepo.instance.getNewsRequest();
    isLoadingRequest = false;
    update();
  }

  @override
  void onInit() {
    getNews();
    super.onInit();
  }
}
