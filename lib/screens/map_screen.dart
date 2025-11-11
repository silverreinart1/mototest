import 'package:flutter/material.dart';
import 'package:motoradar/theme/theme.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedIndex = 2;
  bool _isRecording = false;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    final routes = ['/', '/participate', '/map', '/profile', '/help'];
    if (index != 2) {
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MotoRadarColors.dark,
      appBar: AppBar(
        title: const Text('Ride Tracker'),
        backgroundColor: MotoRadarColors.dark,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Map Placeholder
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: MotoRadarColors.charcoal,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: MotoRadarColors.orange.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 64,
                      color: MotoRadarColors.orange,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Map View (GPS Tracker)',
                      style: TextStyle(
                        color: MotoRadarColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Real-time GPS tracking will appear here',
                      style: TextStyle(
                        color: MotoRadarColors.gray400,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Recording Controls
              Text(
                'RECORD YOUR RIDE',
                style: TextStyle(
                  color: MotoRadarColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 16),

              // Start/Stop Button
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isRecording = !_isRecording;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRecording
                        ? Colors.red
                        : MotoRadarColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _isRecording
                            ? Icons.stop_circle
                            : Icons.play_circle_filled,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _isRecording ? 'STOP RECORDING' : 'START RECORDING',
                        style: TextStyle(
                          color: MotoRadarColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Live Stats
              if (_isRecording) ...[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red.withOpacity(0.1),
                        Colors.red.withOpacity(0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.red.withOpacity(0.3),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LIVE STATS',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _StatColumn('Distance', '12.5 km'),
                          _StatColumn('Avg Speed', '65 km/h'),
                          _StatColumn('Max Speed', '95 km/h'),
                          _StatColumn('Time', '11:32'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Recent Recordings
              Text(
                'RECENT RECORDINGS',
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
                  'date': 'Today at 3:45 PM',
                  'distance': '28.3 km',
                  'time': '32 min',
                  'avgSpeed': '52 km/h'
                },
                {
                  'date': 'Yesterday at 6:15 PM',
                  'distance': '42.5 km',
                  'time': '48 min',
                  'avgSpeed': '53 km/h'
                },
              ].map((recording) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MotoRadarColors.charcoal,
                      borderRadius: BorderRadius.circular(12),
                      border: Border(
                        left: BorderSide(
                          color: MotoRadarColors.orange,
                          width: 3,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recording['date'] as String,
                              style: TextStyle(
                                color: MotoRadarColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${recording['distance']} • ${recording['avgSpeed']}',
                              style: TextStyle(
                                color: MotoRadarColors.gray400,
                                fontSize: 10,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        Text(
                          recording['time'] as String,
                          style: TextStyle(
                            color: MotoRadarColors.orange,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 40),
            ],
          ),
        ),
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

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;

  const _StatColumn(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: MotoRadarColors.gray400,
            fontSize: 10,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: MotoRadarColors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
