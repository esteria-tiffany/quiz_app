import 'package:get/get.dart';

import '../modules/answer_quiz/bindings/answer_quiz_binding.dart';
import '../modules/answer_quiz/views/answer_quiz_view.dart';
import '../modules/create_quiz/bindings/create_quiz_binding.dart';
import '../modules/create_quiz/views/create_quiz_view.dart';
import '../modules/create_quiz/views/list_quiz_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/name_input/bindings/name_input_binding.dart';
import '../modules/name_input/views/name_input_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_QUIZ,
      page: () => const CreateQuizView(),
      binding: CreateQuizBinding(),
    ),
    GetPage(
      name: _Paths.LIST_QUIZ,
      page: () => const ListQuizView(),
    ),
    GetPage(
      name: _Paths.ANSWER_QUIZ,
      page: () => const AnswerQuizView(),
      binding: AnswerQuizBinding(),
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => const LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
    GetPage(
      name: _Paths.NAME_INPUT,
      page: () => const NameInputView(),
      binding: NameInputBinding(),
    ),
  ];
}