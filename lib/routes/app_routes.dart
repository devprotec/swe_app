import 'package:david_s_application/presentation/splash_screen/splash_screen.dart';
import 'package:david_s_application/presentation/splash_screen/binding/splash_binding.dart';
import 'package:david_s_application/presentation/log_in_screen/log_in_screen.dart';
import 'package:david_s_application/presentation/log_in_screen/binding/log_in_binding.dart';
import 'package:david_s_application/presentation/student_admin_choice_screen/student_admin_choice_screen.dart';
import 'package:david_s_application/presentation/student_admin_choice_screen/binding/student_admin_choice_binding.dart';
import 'package:david_s_application/presentation/admin_lh_216_screen/admin_lh_216_screen.dart';
import 'package:david_s_application/presentation/admin_lh_216_screen/binding/admin_lh_216_binding.dart';
import 'package:david_s_application/presentation/default_lh_216_screen/default_lh_216_screen.dart';
import 'package:david_s_application/presentation/default_lh_216_screen/binding/default_lh_216_binding.dart';
import 'package:david_s_application/presentation/admin_lh_216_tomorrow_screen/admin_lh_216_tomorrow_screen.dart';
import 'package:david_s_application/presentation/admin_lh_216_tomorrow_screen/binding/admin_lh_216_tomorrow_binding.dart';
import 'package:david_s_application/presentation/default_lh_216_tomorrow_screen/default_lh_216_tomorrow_screen.dart';
import 'package:david_s_application/presentation/default_lh_216_tomorrow_screen/binding/default_lh_216_tomorrow_binding.dart';
import 'package:david_s_application/presentation/admin_page_screen/admin_page_screen.dart';
import 'package:david_s_application/presentation/admin_page_screen/binding/admin_page_binding.dart';
import 'package:david_s_application/presentation/student_page_screen/student_page_screen.dart';
import 'package:david_s_application/presentation/student_page_screen/binding/student_page_binding.dart';
import 'package:david_s_application/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:david_s_application/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splashScreen = '/splash_screen';

  static String logInScreen = '/log_in_screen';

  static String studentAdminChoiceScreen = '/student_admin_choice_screen';

  static String adminLh216Screen = '/admin_lh_216_screen';

  static String defaultLh216Screen = '/default_lh_216_screen';

  static String adminLh216TomorrowScreen = '/admin_lh_216_tomorrow_screen';

  static String defaultLh216TomorrowScreen = '/default_lh_216_tomorrow_screen';

  static String adminPageScreen = '/admin_page_screen';

  static String studentPageScreen = '/student_page_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: logInScreen,
      page: () => LogInScreen(),
      bindings: [
        LogInBinding(),
      ],
    ),
    GetPage(
      name: studentAdminChoiceScreen,
      page: () => StudentAdminChoiceScreen(),
      bindings: [
        StudentAdminChoiceBinding(),
      ],
    ),
    GetPage(
      name: adminLh216Screen,
      page: () => AdminLh216Screen(),
      bindings: [
        AdminLh216Binding(),
      ],
    ),
    // GetPage(
    //   name: defaultLh216Screen,
    //   page: () => DefaultLh216Screen(),
    //   bindings: [
    //     DefaultLh216Binding(),
    //   ],
    // ),
    GetPage(
      name: adminLh216TomorrowScreen,
      page: () => AdminLh216TomorrowScreen(),
      bindings: [
        AdminLh216TomorrowBinding(),
      ],
    ),
    // GetPage(
    //   name: defaultLh216TomorrowScreen,
    //   page: () => DefaultLh216TomorrowScreen(),
    //   bindings: [
    //     DefaultLh216TomorrowBinding(),
    //   ],
    // ),
    GetPage(
      name: adminPageScreen,
      page: () => AdminPageScreen(),
      bindings: [
        AdminPageBinding(),
      ],
    ),
    GetPage(
      name: studentPageScreen,
      page: () => StudentPageScreen(),
      bindings: [
        StudentPageBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
