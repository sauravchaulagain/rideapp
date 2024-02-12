// import 'package:flutter/material.dart';

// import '../theme.dart';

// class TabBarButton extends StatelessWidget {
//   final Function onTap;
//   final String name;
//   final bool isSelected;

//   const TabBarButton({
//     super.key,
//     required this.name,
//     required this.onTap,
//     required this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final _theme = Theme.of(context);
//     final _textTheme = _theme.textTheme;

//     return InkWell(
//       onTap: () {
//         onTap();
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         margin: EdgeInsets.symmetric(horizontal: 6),
//         decoration: BoxDecoration(
//           color: isSelected
//               ? CustomTheme.primaryColor
//               : CustomTheme.lightColor.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Center(
//             child: Text(name,
//                 style: _textTheme.titleLarge!.copyWith(
//                   color: isSelected
//                       ? CustomTheme.lightColor
//                       : CustomTheme.lightColor.withOpacity(0.5),
//                 ))),
//       ),
//     );
//   }
// }
