import 'package:flutter/material.dart';
import 'package:motoradar/models/rider_model.dart';
import 'package:motoradar/models/ride_event_model.dart';
import 'package:motoradar/theme/theme.dart';
import 'package:motoradar/widgets/recent_ride_card.dart';
import 'package:motoradar/widgets/rider_avatar.dart';
import 'package:motoradar/widgets/ride_event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<RiderModel> riders = [
    RiderModel(name: 'Alex', initials: 'AJ', rating: 4.8, isActive: true),
    RiderModel(name: 'Maria', initials: 'MG', rating: 4.9, isActive: false),
    RiderModel(name: 'David', initials: 'DS', rating: 4.6, isActive: true),
    RiderModel(name: 'Sarah', initials: 'SW', rating: 4.7, isActive: false),
    RiderModel(name: 'John', initials: 'JD', rating: 4.5, isActive: true),
    RiderModel(name: 'Emma', initials: 'EB', rating: 5.0, isActive: false),
  ];

  final List<RideEventModel> upcomingRides = [
    RideEventModel(
      title: 'City Thrill Ride',
      location: 'Downtown Circuit',
      time: 'Tonight 7:00 PM',
      difficulty: 'Hard',
      riders: 8,
      distance: '38 km',
    ),
    RideEventModel(
      title: 'Coastal Cruise',
      location: 'Pacific Highway',
      time: 'Tomorrow 9:00 AM',
      difficulty: 'Medium',
      riders: 12,
      distance: '65 km',
    ),
    RideEventModel(
      title: 'Mountain Challenge',
      location: 'Alpine Pass',
      time: 'Sunday 8:00 AM',
      difficulty: 'Hard',
      riders: 6,
      distance: '72 km',
    ),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    final routes = ['/', '/participate', '/map', '/profile', '/help'];
    if (index > 0) {
      Navigator.pushNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MotoRadarColors.dark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80,
            pinned: true,
            backgroundColor: MotoRadarColors.dark,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, MotoRadarColors.dark],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'WELCOME BACK, RIDER',
                          style: TextStyle(
                            color: MotoRadarColors.orange,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'MotoRadar',
                          style: TextStyle(
                            color: MotoRadarColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            MotoRadarColors.orange,
                            MotoRadarColors.orangeDark,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: MotoRadarColors.orange.withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.local_fire_department,
                          color: MotoRadarColors.white, size: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Recent Ride Section
                Text(
                  'YOUR LAST RIDE',
                  style: TextStyle(
                    color: MotoRadarColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                const RecentRideCard(),
                const SizedBox(height: 24),

                // Riding Squad Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'RIDING SQUAD',
                      style: TextStyle(
                        color: MotoRadarColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '${riders.length} RIDERS',
                      style: TextStyle(
                        color: MotoRadarColors.orange,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: riders.length,
                  itemBuilder: (context, index) {
                    return RiderAvatar(rider: riders[index]);
                  },
                ),
                const SizedBox(height: 24),

                // Group Rides Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'GROUP RIDES',
                      style: TextStyle(
                        color: MotoRadarColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '${upcomingRides.length}',
                      style: TextStyle(
                        color: MotoRadarColors.orange,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...upcomingRides.map((ride) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: RideEventCard(ride: ride),
                  );
                }).toList(),
                const SizedBox(height: 20),

                // Leaderboard Teaser
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MotoRadarColors.orange.withOpacity(0.1),
                        MotoRadarColors.accent.withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: MotoRadarColors.orange.withOpacity(0.2),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        '🏆 TOP PERFORMER',
                        style: TextStyle(
                          color: MotoRadarColors.orange,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Top 15% this month!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MotoRadarColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Keep riding to climb higher',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MotoRadarColors.gray400,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MotoRadarColors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'View Leaderboard',
                            style: TextStyle(
                              color: MotoRadarColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
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
