import 'package:flutter/material.dart';
import 'package:motoradar/theme/theme.dart';
import 'package:motoradar/providers/user_provider.dart';
import 'package:motoradar/screens/login_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    final routes = ['/', '/participate', '/map', '/profile', '/help'];
    if (index != 3) {
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MotoRadarColors.dark,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: MotoRadarColors.dark,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Profile Header
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MotoRadarColors.orange,
                        MotoRadarColors.orangeDark,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person,
                          size: 48,
                          color: MotoRadarColors.orange,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Alex Johnson',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        'Pro Rider • Level 5',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Statistics
                Text(
                  'MOTO STATISTICS',
                  style: TextStyle(
                    color: MotoRadarColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _StatCard('Total Rides', '127', Icons.two_wheeler),
                    _StatCard('Total Distance', '2,450 km', Icons.navigation),
                    _StatCard('Avg Speed', '68 km/h', Icons.speed),
                    _StatCard('Riding Days', '84', Icons.calendar_today),
                  ],
                ),
                const SizedBox(height: 24),

                // Bike Maintenance Logs
                Text(
                  'BIKE MAINTENANCE',
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
                    'bike': 'Kawasaki Ninja H2',
                    'lastService': 'Dec 15, 2024',
                    'nextService': 'Mar 15, 2025',
                    'mileage': '8,245 km',
                    'status': 'Good'
                  },
                  {
                    'bike': 'Yamaha MT-09',
                    'lastService': 'Oct 20, 2024',
                    'nextService': 'Jan 20, 2025',
                    'mileage': '12,890 km',
                    'status': 'Maintenance Soon'
                  },
                ].map((bike) {
                  final isGood = bike['status'] == 'Good';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MotoRadarColors.charcoal,
                        borderRadius: BorderRadius.circular(12),
                        border: Border(
                          left: BorderSide(
                            color: isGood ? Colors.green : Colors.orange,
                            width: 3,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                bike['bike'] as String,
                                style: TextStyle(
                                  color: MotoRadarColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isGood
                                      ? Colors.green.withOpacity(0.2)
                                      : Colors.orange.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  bike['status'] as String,
                                  style: TextStyle(
                                    color:
                                        isGood ? Colors.green : Colors.orange,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Last Service',
                                    style: TextStyle(
                                      color: MotoRadarColors.gray400,
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    bike['lastService'] as String,
                                    style: TextStyle(
                                      color: MotoRadarColors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Mileage',
                                    style: TextStyle(
                                      color: MotoRadarColors.gray400,
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    bike['mileage'] as String,
                                    style: TextStyle(
                                      color: MotoRadarColors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
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

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatCard(this.label, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MotoRadarColors.charcoal,
            MotoRadarColors.dark,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border(
          top: BorderSide(
            color: MotoRadarColors.orange.withOpacity(0.3),
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: MotoRadarColors.orange, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MotoRadarColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MotoRadarColors.gray400,
              fontSize: 10,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
