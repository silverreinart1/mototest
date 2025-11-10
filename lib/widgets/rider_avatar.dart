import 'package:flutter/material.dart';
import 'package:motoradar/models/rider_model.dart';
import 'package:motoradar/theme/theme.dart';

class RiderAvatar extends StatelessWidget {
  final RiderModel rider;

  const RiderAvatar({Key? key, required this.rider}) : super(key: key);

  Color _getColorForInitials(String initials) {
    final colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.blue,
      Colors.purple,
      Colors.pink,
    ];
    final index = initials.codeUnitAt(0) % colors.length;
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColorForInitials(rider.initials);

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: rider.isActive
                      ? MotoRadarColors.accent
                      : MotoRadarColors.orange,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  rider.initials,
                  style: TextStyle(
                    color: MotoRadarColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            // Online indicator
            if (rider.isActive)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: MotoRadarColors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            // Star badge
            Positioned(
              top: -4,
              right: -4,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: MotoRadarColors.orange,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: MotoRadarColors.orange.withOpacity(0.5),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.star,
                  size: 12,
                  color: MotoRadarColors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          rider.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: MotoRadarColors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 10,
              color: MotoRadarColors.orange,
            ),
            const SizedBox(width: 2),
            Text(
              rider.rating.toStringAsFixed(1),
              style: TextStyle(
                color: MotoRadarColors.orange,
                fontSize: 9,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
