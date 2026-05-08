import 'package:flutter/material.dart';
import 'package:wealth_wave/core/common/extenstions/page_controller.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  final PageController pageController;
  final Color? selectedItemColor;
  final List<CustomBottomAppBarItem> children;
  const CustomBottomAppBar({
    super.key,
    this.selectedItemColor,
    required this.pageController,
    required this.children,
  }) : assert(children.length == 5, 'children must be exactly 5 items');

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(_onPageChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.pageController.hasClients) {
        setState(() {
          _currentIndex = widget.pageController.page?.round() ?? 0;
        });
      }
    });
  }

  void _onPageChange() {
    if (widget.pageController.hasClients) {
      final newIndex = widget.pageController.page?.round() ?? 0;
      if (newIndex != _currentIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      }
    }
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_onPageChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = widget.pageController.selectedBottomAppBarItemIndex;

    return BottomAppBar(
      color: AppColors.deepBackground,
      shape: const CircularNotchedRectangle(),
      elevation: 8.0,
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.children.length, (index) {
          final item = widget.children[index];
          final isCurrentItem = index == selectedIndex;

          return Expanded(
            key: item.key,
            child: InkWell(
              onTap: item.onPressed,
              onTapUp: (_) {
                widget.pageController.setBottomAppBarItemIndex = index;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Icon(
                  isCurrentItem ? item.primaryIcon : item.secondaryIcon,
                  color: isCurrentItem
                      ? widget.selectedItemColor
                      : AppColors.textDisabled,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CustomBottomAppBarItem {
  final Key? key;
  final String? label;
  final IconData? primaryIcon;
  final IconData? secondaryIcon;
  final VoidCallback? onPressed;

  const CustomBottomAppBarItem({
    this.key,
    this.label,
    this.primaryIcon,
    this.secondaryIcon,
    this.onPressed,
  });

  CustomBottomAppBarItem.empty({
    this.key,
    this.label,
    this.primaryIcon,
    this.secondaryIcon,
    this.onPressed,
  });
}
