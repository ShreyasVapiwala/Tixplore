import 'package:flutter/material.dart';
import 'package:ticket_reselling/screens/home_page.dart';

class CitySelectionPage extends StatelessWidget {
  final List<Map<String, dynamic>> cities = [
    {'name': 'Mumbai', 'icon': Icons.location_city}, // Gateway of India (generic city icon)
    {'name': 'Delhi', 'icon': Icons.account_balance}, // India Gate (government symbol)
    {'name': 'Ahmedabad', 'icon': Icons.home_work}, // Sabarmati Ashram (work/home symbol)
    {'name': 'Chandigarh', 'icon': Icons.park}, // Rock Garden (garden/park symbol)
    {'name': 'Bengaluru', 'icon': Icons.computer}, // Tech capital (computer symbol)
    {'name': 'Chennai', 'icon': Icons.beach_access}, // Marina Beach (beach symbol)
    {'name': 'Pune', 'icon': Icons.castle}, // Shaniwar Wada (castle/fort symbol)
    {'name': 'Kolkata', 'icon': Icons.architecture}, // Icon representing Howrah Bridge (abstract structure)
    {'name': 'Jaipur', 'icon': Icons.temple_hindu}, // Hawa Mahal (temple symbol)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/start_screen_bg.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          // Heading Section
                          SizedBox(height: 40), // Spacing from the top
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Hey there!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Please select your city',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          // Grid of cities
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // Number of items per row
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: cities.length,
                            itemBuilder: (context, index) {
                              final city = cities[index];
                              return GestureDetector(
                                onTap: () {
                                  // Navigate to HomePage after selecting a city
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                  print('Selected city: ${city['name']}');
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Icon(
                                        city['icon'], // Use the dynamic icon here
                                        color: Colors.purple,
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      city['name'], // City name
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Next Button
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Navigate to HomePage when clicking the button
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_forward, color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
