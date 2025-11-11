import 'package:flutter/material.dart';
import 'package:motoradar/models/ride_event_model.dart';
import 'package:motoradar/theme/theme.dart';
import 'package:motoradar/widgets/ride_event_card.dart';

class ParticipateScreen extends StatefulWidget {
  const ParticipateScreen({Key? key}) : super(key: key);

  @override
  State<ParticipateScreen> createState() => _ParticipateScreenState();
}

class _ParticipateScreenState extends State<ParticipateScreen> {
  int _selectedIndex = 1;

  final List<RideEventModel> myRides = [
    RideEventModel(
      title: 'Mountain Adventure',
      location: 'Alpine Pass',
      time: 'Completed Yesterday',
      difficulty: 'Hard',
      riders: 12,
      distance: '75 km',
    ),
    RideEventModel(
      title: 'City Tour',
      location: 'Downtown',
      time: 'Completed Last Week',
      difficulty: 'Easy',
      riders: 8,
      distance: '25 km',
    ),
  ];

  final List<RideEventModel> availableRides = [
    RideEventModel(
      title: 'Sunset Cruise',
      location: 'Coastal Road',
      time: 'Tomorrow 6:00 PM',
      difficulty: 'Easy',
      riders: 5,
      distance: '45 km',
    ),
    RideEventModel(
      title: 'Canyon Chase',
      location: 'Desert Canyon',
      time: 'Saturday 8:00 AM',
      difficulty: 'Hard',
      riders: 10,
      distance: '85 km',
    ),
    RideEventModel(
      title: 'Urban Race',
      location: 'City Center',
      time: 'Next Week 7:00 PM',
      difficulty: 'Medium',
      riders: 15,
      distance: '35 km',
    ),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    final routes = ['/', '/participate', '/map', '/profile', '/help'];
    if (index != 1) {
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MotoRadarColors.dark,
      appBar: AppBar(
        title: const Text('Community Rides'),
        backgroundColor: MotoRadarColors.dark,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'MY RIDES',
                  style: TextStyle(
                    color: MotoRadarColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                ...myRides.map((ride) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: RideEventCard(ride: ride),
                  );
                }).toList(),
                const SizedBox(height: 24),
                Text(
                  'AVAILABLE RIDES',
                  style: TextStyle(
                    color: MotoRadarColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                ...availableRides.map((ride) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: RideEventCard(ride: ride),
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
