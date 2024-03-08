import 'package:flutter/material.dart';
import 'package:ridesharing/common/theme.dart';

class CommonDetailBox extends StatelessWidget {
  final String? trailingImage;
  final double verticalPadding;
  final double horizontalPadding;
  final bool showTrailingWidget;
  final String title;
  final String detail;
  final VoidCallback onBoxPressed;

  const CommonDetailBox(
      {super.key,
      this.verticalPadding = 10.0,
      this.horizontalPadding = 20.0,
      required this.title,
      this.showTrailingWidget = true,
      this.detail = "",
      required this.onBoxPressed,
      this.trailingImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: InkWell(
        onTap: () {
          onBoxPressed.call();
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w700)),
                  Text(detail, style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            SizedBox(width: 20),
            if (showTrailingWidget)
              if (trailingImage != null)
                Image.network(
                  trailingImage.toString(),
                  color: CustomTheme.darkerBlack,
                  height: 20,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
          ],
        ),
      ),
    );
  }
}
