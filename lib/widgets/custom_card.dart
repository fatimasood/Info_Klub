import 'package:flutter/material.dart';

import '../app/theme.dart';

Widget InfoCard(
  BuildContext context, {
  required IconData icon,
  required Color iconColor,
  required String title,
  required String description,
  required Color backgroundColor,
  Color? arrowColor,
  VoidCallback? onTap,
  VoidCallback? editAction,
  VoidCallback? downloadAction,
  required Color descolor,
  bool showIcons = false, // Show Edit & Download icons
  bool showArrow = false, // Show right-side arrow
}) {
  return GestureDetector(
    onTap: showIcons ? null : onTap, // Disable card tap if icons are shown
    child: Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: AppTheme.whiteColor, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor.withOpacity(0.1),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 28.0,
                ),
              ),
              const SizedBox(width: 12.0),
              // Title and Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: iconColor,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: descolor,
                      ),
                    ),
                  ],
                ),
              ),
              if (showArrow) // Conditionally show the arrow
                Icon(
                  Icons.arrow_forward_ios,
                  color: arrowColor,
                  size: 18.0,
                ),
            ],
          ),
          if (showIcons) ...[
            const SizedBox(height: 10.0),
            // Edit and Download Row
            Row(
              children: [
                InkWell(
                  onTap: editAction,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: AppTheme.forestGreen,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(Icons.edit, color: Colors.white, size: 16.0),
                          SizedBox(width: 4.0),
                          Text(
                            "Edit",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                InkWell(
                  onTap: downloadAction,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: AppTheme.forestGreen,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(Icons.download, color: Colors.white, size: 16.0),
                          SizedBox(width: 4.0),
                          Text(
                            "Download",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    ),
  );
}
