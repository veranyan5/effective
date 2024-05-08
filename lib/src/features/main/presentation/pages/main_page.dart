import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/placeholder_screen.dart';
import '../../../home/presentation/pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [
        HomePage(),
        PlaceholderScreen(),
        PlaceholderScreen(),
        PlaceholderScreen(),
        PlaceholderScreen(),
      ],
      backgroundColor: AppColors.basicBlack,
      navBarStyle: NavBarStyle.style6,
      items: [
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.specialBlue,
          inactiveColorPrimary: AppColors.basicGray6,
          title: 'Авиабилеты',
          icon: SvgPicture.asset(
            'assets/svg/small_plane.svg',
            colorFilter: const ColorFilter.mode(AppColors.specialBlue, BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/svg/small_plane.svg',
            colorFilter: const ColorFilter.mode(AppColors.basicGray6, BlendMode.srcIn),
          ),
        ),
        PersistentBottomNavBarItem(
          title: 'Отели',
          inactiveColorPrimary: AppColors.basicGray6,
          icon: SvgPicture.asset(
            'assets/svg/hotel.svg',
            colorFilter: const ColorFilter.mode(AppColors.specialBlue, BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/svg/hotel.svg',
            colorFilter: const ColorFilter.mode(AppColors.basicGray6, BlendMode.srcIn),
          ),
        ),
        PersistentBottomNavBarItem(
          title: 'Короче',
          inactiveColorPrimary: AppColors.basicGray6,
          icon: SvgPicture.asset(
            'assets/svg/location.svg',
            colorFilter: const ColorFilter.mode(AppColors.specialBlue, BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/svg/location.svg',
            colorFilter: const ColorFilter.mode(AppColors.basicGray6, BlendMode.srcIn),
          ),
        ),
        PersistentBottomNavBarItem(
          title: 'Подписки',
          inactiveColorPrimary: AppColors.basicGray6,
          icon: SvgPicture.asset(
            'assets/svg/subscribtion.svg',
            colorFilter: const ColorFilter.mode(AppColors.specialBlue, BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/svg/subscribtion.svg',
            colorFilter: const ColorFilter.mode(AppColors.basicGray6, BlendMode.srcIn),
          ),
        ),
        PersistentBottomNavBarItem(
          title: 'Профиль',
          inactiveColorPrimary: AppColors.basicGray6,
          icon: SvgPicture.asset(
            'assets/svg/profile.svg',
            colorFilter: const ColorFilter.mode(AppColors.specialBlue, BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/svg/profile.svg',
            colorFilter: const ColorFilter.mode(AppColors.basicGray6, BlendMode.srcIn),
          ),
        ),
      ],
      // child: Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: AppColors.basicBlack,
      //   onTap: (value) {
      //     if (value == 0) {
      //       context.push('/home');
      //     } else {
      //       context.push('/placeholder');
      //     }
      //   },
      // items: [
      //   BottomNavigationBarItem(
      //     backgroundColor: AppColors.basicBlack,
      //     label: 'Авиабилеты',
      //     icon: SvgPicture.asset('assets/svg/small_plane.svg'),
      //   ),
      //   BottomNavigationBarItem(
      //     label: 'Отели',
      //     icon: SvgPicture.asset('assets/svg/hotel.svg'),
      //   ),
      //   BottomNavigationBarItem(
      //     label: 'Короче',
      //     icon: SvgPicture.asset('assets/svg/location.svg'),
      //   ),
      //   BottomNavigationBarItem(
      //     label: 'Подписки',
      //     icon: SvgPicture.asset('assets/svg/subscribtion.svg'),
      //   ),
      //   BottomNavigationBarItem(
      //     label: 'Профиль',
      //     icon: SvgPicture.asset('assets/svg/profile.svg'),
      //   ),
      // ],
      // ),
      // ),
    );
  }
}
