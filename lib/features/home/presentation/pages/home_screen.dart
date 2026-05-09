import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wealth_wave/core/common/extenstions/sizes.dart';
import 'package:wealth_wave/core/common/widget/custom_circular_progress_indicator.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';
import 'package:wealth_wave/di/locator.dart';
import 'package:wealth_wave/features/home/presentation/bloc/home_state.dart';
import 'package:wealth_wave/features/home/presentation/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = locator.get<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = MediaQuery.sizeOf(context).width <= 360
        ? 0.8
        : 1.0;

    return SingleChildScrollView(
      // Good practice
      child: Stack(
        children: [
          SizedBox(height: Sizes().height, width: double.infinity),
          // Gradient Background
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 320.h, // Slightly increased for better curve
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.primaryGradient,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(500, 40),
                  bottomRight: Radius.elliptical(500, 40),
                ),
              ),
            ),
          ),

          // Welcome Section
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 75.h, // Adjusted
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back!',
                      textScaler: TextScaler.linear(textScaleFactor),
                      style: AppTextStyle.bodySmall,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Muhammed Amin',
                      textScaler: TextScaler.linear(textScaleFactor),
                      style: AppTextStyle.headlineSmall,
                    ),
                  ],
                ),
                // Notification
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.cardBackground.withValues(alpha: 0.5),
                  ),
                  child: Stack(
                    alignment: const Alignment(0.5, -0.5),
                    children: [
                      const Icon(
                        Icons.notifications_none_outlined,
                        color: AppColors.textSecondary,
                      ),
                      Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: AppColors.warning,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Balance Card
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 190.h, // Adjusted position
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.secondaryGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Balance',
                            textScaler: TextScaler.linear(textScaleFactor),
                            style: AppTextStyle.bodySmall,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '\$12,345.67',
                            textScaler: TextScaler.linear(textScaleFactor),
                            style: AppTextStyle.headlineMedium,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => log('options'),
                        child: PopupMenuButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            Icons.more_horiz_rounded,
                            color: AppColors.textSecondary,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              height: 24.0,
                              child: Text('Refresh'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 36.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Income
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.income.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.arrow_upward,
                              size: 16,
                              color: AppColors.income,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Income',
                                textScaler: TextScaler.linear(textScaleFactor),
                                style: AppTextStyle.bodySmall,
                              ),
                              Text(
                                '\$850.00',
                                textScaler: TextScaler.linear(textScaleFactor),
                                style: AppTextStyle.bodyMedium.copyWith(
                                  color: AppColors.income,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Expense
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.expense.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.arrow_downward,
                              size: 16,
                              color: AppColors.expense,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expense',
                                textScaler: TextScaler.linear(textScaleFactor),
                                style: AppTextStyle.bodySmall,
                              ),
                              Text(
                                '\$625.00',
                                textScaler: TextScaler.linear(textScaleFactor),
                                style: AppTextStyle.bodyMedium.copyWith(
                                  color: AppColors.expense,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 397.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transactions History',
                        style: AppTextStyle.bodyLarge,
                      ),
                      Text(
                        'See All',
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: AnimatedBuilder(
                    animation: homeController,
                    builder: (context, child) {
                      if (homeController.state is HomeLoadingState) {
                        return CustomCircularProgressIndicator();
                      }
                      if (homeController.state is HomeErrorState) {
                        // Icon for a wallet and text
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground.withValues(
                                alpha: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 48,
                                  color: AppColors.textHint,
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'Failed to load transactions',
                                  style: AppTextStyle.bodyMedium.copyWith(
                                    color: AppColors.textHint,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      if (homeController.transactions.isEmpty) {
                        // Icon for a wallet and text
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground.withValues(
                                alpha: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 48,
                                  color: AppColors.textHint,
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'No transactions yet',
                                  style: AppTextStyle.bodyMedium.copyWith(
                                    color: AppColors.textHint,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          bottom: 90,
                        ),
                        itemCount: homeController.transactions.length,
                        itemBuilder: (context, index) {
                          final transaction =
                              homeController.transactions[index];

                          final color = transaction.amount.isNegative
                              ? AppColors.expense.withValues(alpha: 0.1)
                              : AppColors.income.withValues(alpha: 0.1);
                          final amount = transaction.amount.toStringAsFixed(2);

                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 12,
                            ),
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                Icons.monetization_on_outlined,
                                size: 20,
                                color: color,
                              ),
                            ),
                            title: Text(
                              transaction.title,
                              style: AppTextStyle.bodyMedium,
                            ),
                            subtitle: Text(
                              '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                              style: AppTextStyle.bodySmall.copyWith(
                                color: AppColors.textHint,
                              ),
                            ),
                            trailing: Text(
                              amount,
                              style: AppTextStyle.bodyMedium.copyWith(
                                color: color,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
