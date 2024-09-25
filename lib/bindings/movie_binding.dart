import 'package:get/get.dart';
import '../controllers/movie_controller.dart';

class MovieBinding extends Bindings {
@override
void dependencies() {
  Get.lazyPut<MovieController>(() => MovieController());
}

}
