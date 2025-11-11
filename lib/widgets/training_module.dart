import 'package:flutter/material.dart';
import 'package:motoradar/theme/theme.dart';

class TrainingModule extends StatelessWidget {
  const TrainingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trainings = [
      {
        'title': 'Cornering Basics',
        'duration': '15 min',
        'difficulty': 'Beginner',
        'progress': 60,
        'icon': Icons.turn_left,
      },
      {
        'title': 'Emergency Braking',
        'duration': '12 min',
        'difficulty': 'Intermediate',
        'progress': 40,
        'icon': Icons.pan_tool,
      },
      {
        'title': 'Mountain Riding',
        'duration': '20 min',
        'difficulty': 'Advanced',
        'progress': 0,
        'icon': Icons.terrain,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TRAINING MODULES',
          style: TextStyle(
            color: MotoRadarColors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 12),
        ...trainings.map((training) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MotoRadarColors.charcoal,
                    MotoRadarColors.dark,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border(
                  left: BorderSide(
                    color: MotoRadarColors.orange,
                    width: 3,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        training['icon'] as IconData,
                        color: MotoRadarColors.orange,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              training['title'] as String,
                              style: TextStyle(
                                color: MotoRadarColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              '${training['duration']} • ${training['difficulty']}',
                              style: TextStyle(
                                color: MotoRadarColors.gray400,
                                fontSize: 10,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: (training['progress'] as int) / 100,
                      minHeight: 6,
                      backgroundColor: MotoRadarColors.charcoal,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        MotoRadarColors.orange,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${training['progress']}% Complete',
                    style: TextStyle(
                      color: MotoRadarColors.accent,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
