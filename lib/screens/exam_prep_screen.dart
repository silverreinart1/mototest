import 'package:flutter/material.dart';
import 'package:motoradar/theme/theme.dart';

class ExamPrepScreen extends StatefulWidget {
  const ExamPrepScreen({Key? key}) : super(key: key);

  @override
  State<ExamPrepScreen> createState() => _ExamPrepScreenState();
}

class _ExamPrepScreenState extends State<ExamPrepScreen> {
  int _selectedIndex = 4;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    final routes = ['/', '/participate', '/map', '/profile', '/help'];
    if (index != 4) {
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MotoRadarColors.dark,
      appBar: AppBar(
        title: const Text('Exam Preparation'),
        backgroundColor: MotoRadarColors.dark,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // License Info
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MotoRadarColors.orange.withOpacity(0.2),
                        MotoRadarColors.orange.withOpacity(0.1),
                      ],
                    ),
                    border: Border.all(
                      color: MotoRadarColors.orange.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A2 LICENSE - CATEGORY A (≤35 kW)',
                        style: TextStyle(
                          color: MotoRadarColors.orange,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Exam Date: April 15, 2025',
                        style: TextStyle(
                          color: MotoRadarColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '42 days remaining',
                        style: TextStyle(
                          color: MotoRadarColors.accent,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Study Progress
                Text(
                  'STUDY PROGRESS',
                  style: TextStyle(
                    color: MotoRadarColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                ...[
                  {
                    'topic': 'Road Signs & Markings',
                    'progress': 85,
                    'total': '50 questions'
                  },
                  {
                    'topic': 'Traffic Rules & Laws',
                    'progress': 70,
                    'total': '45 questions'
                  },
                  {
                    'topic': 'Motorcycle Safety',
                    'progress': 60,
                    'total': '40 questions'
                  },
                  {
                    'topic': 'Emergency Procedures',
                    'progress': 40,
                    'total': '30 questions'
                  },
                ].map((topic) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              topic['topic'] as String,
                              style: TextStyle(
                                color: MotoRadarColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              '${topic['progress']}%',
                              style: TextStyle(
                                color: MotoRadarColors.orange,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: (topic['progress'] as int) / 100,
                            minHeight: 6,
                            backgroundColor: MotoRadarColors.charcoal,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              MotoRadarColors.orange,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          topic['total'] as String,
                          style: TextStyle(
                            color: MotoRadarColors.gray400,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                const SizedBox(height: 24),

                // Practice Tests
                Text(
                  'PRACTICE TESTS',
                  style: TextStyle(
                    color: MotoRadarColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                ...[
                  {
                    'test': 'Full License Exam Simulation',
                    'questions': '100 questions',
                    'duration': '60 minutes',
                    'passed': true
                  },
                  {
                    'test': 'Road Signs Quiz',
                    'questions': '50 questions',
                    'duration': '30 minutes',
                    'passed': true
                  },
                  {
                    'test': 'Safety Procedures Test',
                    'questions': '40 questions',
                    'duration': '25 minutes',
                    'passed': false
                  },
                ].map((test) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MotoRadarColors.charcoal,
                        borderRadius: BorderRadius.circular(12),
                        border: Border(
                          left: BorderSide(
                            color: test['passed'] as bool
                                ? Colors.green
                                : Colors.orange,
                            width: 3,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  test['test'] as String,
                                  style: TextStyle(
                                    color: MotoRadarColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${test['questions']} • ${test['duration']}',
                                  style: TextStyle(
                                    color: MotoRadarColors.gray400,
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            test['passed'] as bool
                                ? Icons.check_circle
                                : Icons.schedule,
                            color: test['passed'] as bool
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 24),

                // Study Tips
                Text(
                  'STUDY TIPS',
                  style: TextStyle(
                    color: MotoRadarColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: MotoRadarColors.charcoal,
                    borderRadius: BorderRadius.circular(12),
                    border: Border(
                      left: BorderSide(
                        color: MotoRadarColors.accent,
                        width: 3,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TipRow('📚', 'Study 30 minutes daily'),
                      const SizedBox(height: 8),
                      _TipRow('⏰', 'Take practice tests weekly'),
                      const SizedBox(height: 8),
                      _TipRow('🎯', 'Focus on weak areas first'),
                      const SizedBox(height: 8),
                      _TipRow('🏍️', 'Practice actual riding skills'),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Participate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  final String emoji;
  final String text;

  const _TipRow(this.emoji, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: MotoRadarColors.white,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}
