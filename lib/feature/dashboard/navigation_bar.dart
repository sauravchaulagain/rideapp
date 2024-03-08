// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ridesharing/common/constant/assets.dart';
// import 'package:ridesharing/common/theme.dart';

// class CustomBottomNavBar extends StatefulWidget {
//   final int selectedIndex;
//   final onItemTapped;
//   const CustomBottomNavBar(
//       {super.key, required this.selectedIndex, this.onItemTapped});

//   @override
//   _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(18),
//         color: CustomTheme.lightColor,
//       ),
//       padding: const EdgeInsets.all(8),
//       child: BottomNavigationBar(
//         elevation: 0,
//         unselectedFontSize: 12,
//         unselectedItemColor: CustomTheme.darkColor.withOpacity(0.7),
//         showUnselectedLabels: true,
//         selectedFontSize: 13,
//         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//                 widget.selectedIndex == 0
//                     ? Assets.houseFillIcon
//                     : Assets.houseIcon,
//                 color: widget.selectedIndex == 0
//                     ? CustomTheme.appColor
//                     : CustomTheme.darkColor.withOpacity(0.7),
//                 width: 30),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//                 widget.selectedIndex == 1
//                     ? Assets.heartFillIcon
//                     : Assets.heartIcon,
//                 color: widget.selectedIndex == 1
//                     ? CustomTheme.appColor
//                     : CustomTheme.darkColor.withOpacity(0.7),
//                 width: 30),
//             label: 'Favourite',
//           ),
//           const BottomNavigationBarItem(
//             icon: SizedBox(
//               width: 30,
//               height: 30,
//             ),
//             label: 'Wallet',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//                 widget.selectedIndex == 3
//                     ? Assets.discountFillIcon
//                     : Assets.discountIcon,
//                 color: widget.selectedIndex == 3
//                     ? CustomTheme.appColor
//                     : CustomTheme.darkColor.withOpacity(0.7),
//                 width: 30),
//             label: 'Offer',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//                 widget.selectedIndex == 4
//                     ? Assets.userFillIcon
//                     : Assets.userIcon,
//                 color: widget.selectedIndex == 4
//                     ? CustomTheme.appColor
//                     : CustomTheme.darkColor.withOpacity(0.7),
//                 width: 30),
//             label: 'Discount',
//           ),
//         ],
//         currentIndex: widget.selectedIndex,
//         onTap: widget.onItemTapped,
//         selectedItemColor: Colors.green,
//       ),
//     );
//   }
// }
