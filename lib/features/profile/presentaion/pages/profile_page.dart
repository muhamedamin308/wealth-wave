import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_wave/config/routes/named_routes.dart';
import 'package:wealth_wave/core/common/widget/custom_circular_progress_indicator.dart';
import 'package:wealth_wave/core/common/widget/custom_modal_bottom_sheet.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/di/locator.dart';
import 'package:wealth_wave/features/profile/presentaion/bloc/profile_state.dart';
import 'package:wealth_wave/features/profile/presentaion/controller/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  @override
  bool get wantKeepAlive => true;

  final ProfileController controller = locator.get<ProfileController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      switch (controller.state) {
        case ProfileLoadingState():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) =>
                const Center(child: CustomCircularProgressIndicator()),
          );
          break;

        case ProfileSuccessState():
          Navigator.of(context).pop(); // Close loading dialog
          CustomMessageBottomSheet.show(
            context,
            title: 'You have been logged out',
            message: 'You have been successfully logged out of your account.',
            isError: false,
            onClose: () {
              context.pushReplacementNamed(NamedRoutes.login);
            },
            messageOnButton: 'Go to Login',
          );
          break;

        case ProfileErrorState():
          Navigator.of(context).pop(); // Close loading dialog
          CustomMessageBottomSheet.show(
            context,
            title: 'Profile Error',
            message: (controller.state as ProfileErrorState).message,
            isError: true,
            messageOnButton: 'Close',
          );
          break;

        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ).copyWith(bottom: 100),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Profile Avatar Section
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: AppColors.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.vibrantTeal.withValues(alpha: 0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              // User Name
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              // User Email
              Text(
                'john.doe@example.com',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 40),
              // Account Section
              _buildMenuSection(
                title: 'Account',
                items: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Edit Profile',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.security,
                    title: 'Security',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Settings Section
              _buildMenuSection(
                title: 'Settings',
                items: [
                  _buildMenuItem(
                    icon: Icons.language,
                    title: 'Language',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.dark_mode_outlined,
                    title: 'Theme',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Logout Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      controller.logout();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.expense.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.expense.withValues(alpha: 0.5),
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.expense,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuSection({
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider, width: 0.5),
          ),
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++) ...[
                items[i],
                if (i < items.length - 1)
                  Container(
                    height: 0.5,
                    color: AppColors.divider,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: AppColors.vibrantTeal, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: AppColors.textDisabled,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
