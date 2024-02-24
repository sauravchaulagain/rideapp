import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/theme.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: CustomTheme.lightColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
        child: Row(
          children: [
            navItem(
              Assets.houseFillIcon,
              pageIndex == 0,
              onTap: () => onTap(0),
            ),
            navItem(
              Assets.heartIcon,
              pageIndex == 1,
              onTap: () => onTap(1),
            ),
            const SizedBox(width: 80),
            navItem(
              Assets.discountIcon,
              pageIndex == 2,
              onTap: () => onTap(2),
            ),
            navItem(
              Assets.userIcon,
              pageIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(String icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          icon,
          color: selected ? CustomTheme.appColor : CustomTheme.darkColor,
        ),
      ),
    );
  }
}
