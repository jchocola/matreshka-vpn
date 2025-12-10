import 'package:go_router/go_router.dart';
import 'package:matreshka_vpn/main_page.dart';
import 'package:matreshka_vpn/presentation/auth_page/auth_page.dart';
import 'package:matreshka_vpn/presentation/defence_page/defence_page.dart';
import 'package:matreshka_vpn/presentation/location_page/location_page.dart';
import 'package:matreshka_vpn/presentation/location_page/page/server_info_page/server_info_page.dart';
import 'package:matreshka_vpn/presentation/onboarding_page/onboarding_page.dart';
import 'package:matreshka_vpn/presentation/profile_page/page/account_setting/account_setting_page.dart';
import 'package:matreshka_vpn/presentation/profile_page/page/achivement_page/achivement_page.dart';
import 'package:matreshka_vpn/presentation/profile_page/page/help_support/help_support_page.dart';
import 'package:matreshka_vpn/presentation/profile_page/profile_page.dart';

final router = GoRouter(
  initialLocation: '/defence_page',

  routes: [
    GoRoute(path: '/onboarding' , builder: (context, state) => OnboardingPage(),),
    GoRoute(path: '/auth' , builder: (context, state) => AuthPage(),),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainPage(navShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/defence_page',
              builder: (context, state) => const DefencePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/location_page',
              builder: (context, state) => const LocationPage(),
              routes: [
                GoRoute(path: '/server_page',builder: (context, state) => const ServerInfoPage(),)
              ]
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile_page',
              builder: (context, state) => const ProfilePage(),
              routes: [
                GoRoute(path: '/account_setting', builder: (context, state) => AccountSettingPage(),),
                  GoRoute(path: '/help_support', builder: (context, state) => HelpSupportPage(),),
                   GoRoute(path: '/achivements', builder: (context, state) => AchivementPage(),),
              ]
            ),
          ],
        ),
      ],
    ),
  ],
);
