import 'package:flutter_get_example/pages/get_controller/get_binding.dart';
import 'package:flutter_get_example/pages/get_controller/get_controller_page.dart';
import 'package:flutter_get_example/pages/obs_get_controller/obs_get_binding.dart';
import 'package:flutter_get_example/pages/obs_get_controller/obs_get_controller_page.dart';
import 'package:flutter_get_example/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
        name: AppRoutes.GET_NORAML,
        page: () => const GetControllerPage(),
        binding: GetIndexBinding()),
    GetPage(
        name: AppRoutes.OBS_GET_NORAML,
        page: () => const ObsGetControllerPage(),
        binding: ObsGetIndexBinding()),
  ];
}
