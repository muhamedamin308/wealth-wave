import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wealth_wave/core/common/widget/custom_bottom_app_bar.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/features/home/presentation/screen/home_page.dart';
import 'package:wealth_wave/features/profile/profile_page.dart';
import 'package:wealth_wave/features/statistics/stats_page.dart';
import 'package:wealth_wave/features/wallet/wallet_page.dart';

class HomePageViewState extends StatefulWidget {
  const HomePageViewState({super.key});

  @override
  State<HomePageViewState> createState() => _HomePageViewStateState();
}

class _HomePageViewStateState extends State<HomePageViewState> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [HomePage(), StatsPage(), WalletPage(), ProfilePage()],
      ),

      // creating a circuler notched bottom app bar with 4 items and a floating action button in the center
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.vibrantTeal,
        splashColor: Colors.white.withValues(alpha: 0.2),
        shape: const CircleBorder(),
        onPressed: () {
          log('Add button pressed');
        },
        child: const Icon(Icons.add, size: 28, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        selectedItemColor: AppColors.vibrantTeal,
        children: [
          CustomBottomAppBarItem(
            label: 'Home',
            primaryIcon: Icons.home,
            secondaryIcon: Icons.home_outlined,
            onPressed: () => pageController.jumpToPage(0),
          ),
          CustomBottomAppBarItem(
            label: 'Stats',
            primaryIcon: Icons.bar_chart,
            secondaryIcon: Icons.bar_chart_outlined,
            onPressed: () => pageController.jumpToPage(1),
          ),
          CustomBottomAppBarItem.empty(), // Empty item for spacing
          CustomBottomAppBarItem(
            label: 'Wallet',
            primaryIcon: Icons.account_balance_wallet,
            secondaryIcon: Icons.account_balance_wallet_outlined,
            onPressed: () => pageController.jumpToPage(2),
          ),
          CustomBottomAppBarItem(
            label: 'Profile',
            primaryIcon: Icons.person,
            secondaryIcon: Icons.person_outline,
            onPressed: () => pageController.jumpToPage(3),
          ),
        ],
        pageController: pageController,
      ),
    );
  }
}
