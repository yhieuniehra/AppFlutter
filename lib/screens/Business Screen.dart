import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:travel_app/screens/TripDetailsWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BusinessScreen(),
    );
  }
}

class BusinessScreen extends StatefulWidget {
  @override
  _MyTripsScreenState createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<BusinessScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Trips"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Image.asset(
          'assets/Mask Group.png', // Replace with your header image asset
          fit: BoxFit.cover,
        ),
        toolbarHeight: 200,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green,
            tabs: [
              Tab(text: "Current Trips"),
              Tab(text: "Next Trips"),
              Tab(text: "Past Trips"),
              Tab(text: "Wish List"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTrips("Current Trips"), // Current trips
                _buildTripsList("Next Trips"), // Next trips
                _buildTrip(context), // Past trips
                _buildTripsList("Wish List"), // Wish List
              ],
            ),
          ),
        ],
      ),
    );
  }

  

  // Create a general widget to show trip list for different tabs
  Widget _buildTripsList(String tabName) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildTripCard(
          imageUrl: 'assets/a.png', // Replace with your image asset
          location: 'Hanoi, Vietnam',
          title: 'Ho Guom Trip',
          date: 'Feb 2, 2020',
          time: '8:00 - 10:00',
          guideName: 'Emmy',
          guideImage: 'assets/anh1.jpg', // Replace with your guide image asset
          status: 'Available',
          actions: ['Detail', 'Chat', 'Pay'],
        ),
        SizedBox(height: 16),
        _buildTripCard(
          imageUrl: 'assets/b.png', // Replace with your image asset
          location: 'Hanoi, Vietnam',
          title: 'Ho Chi Minh Mausoleum',
          date: 'Feb 2, 2020',
          time: '8:00 - 10:00',
          guideName: 'Emmy',
          guideImage: 'assets/anh2.jpg', // Replace with your guide image asset
          status: 'Waiting',
          actions: ['Detail', 'Chat'],
        ),
        SizedBox(height: 16),
        _buildTripCard(
          imageUrl: 'assets/c.png', // Replace with your image asset
          location: 'Ho Chi Minh, Vietnam',
          title: 'Duc Ba Church',
          date: 'Feb 2, 2020',
          time: '8:00 - 10:00',
          guideName: 'Waiting for offers',
          guideImage: 'assets/anh3.jpg', // Replace with your guide image asset
          status: 'Bidding',
          actions: ['Detail', 'Chat'],
        ),
      ],
    );
  }

  

  Widget _buildTrip(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Header with Overlay Icons
            Stack(
              children: [
                Image.asset(
                  'assets/hoian.jpg', // Replace with your image asset
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.chat_bubble, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Row(
                    children:const [
                      Icon(Icons.thumb_up, color: Colors.green),
                      SizedBox(width: 4),
                      Text("46", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Section
                  Text(
                    "Title here: Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children:const [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'asstes/congai.png'), // Replace with your image asset
                        radius: 16,
                      ),
                      SizedBox(width: 8),
                      Text("Chin-Sun",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Text("Mar 8, 2020", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Description Section
                  Text(
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  // Embedded Video/Image with Play Button
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/Groupgai.png', // Replace with your image asset
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Icon(Icons.play_circle_fill,
                          color: Colors.white, size: 50),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Sub-Header Section
                  Text(
                    "Header here: Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  // Multi-Image Row
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/Groupgai1.png', // Replace with your image asset
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/Mask Group@2x.png', // Replace with your image asset
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Final Paragraph and Link
                  RichText(
                    text: TextSpan(
                      text:
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: const [
                        TextSpan(
                          text:
                              " It was popularised in the 1960s with the release of Letraset sheets (Link)",
                          style: TextStyle(color: Colors.blue),
                          // Add onTap for clickable links if needed
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  

  Widget _buildTrips(String tabName) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildTripCard(
          imageUrl: 'assets/dangnang.png', // Replace with your image asset
          location: 'Hanoi, Vietnam',
          title: 'Ho Guom Trip',
          date: 'Feb 2, 2020',
          time: '8:00 - 10:00',
          guideName: 'Emmy',
          guideImage: 'assets/anh1.jpg', // Replace with your guide image asset
          status: 'Available',
          actions: ['Detail', 'Chat', 'Pay'],
        ),
      ],
    );
  }

  Widget _buildTripCard({
    required String imageUrl,
    required String location,
    required String title,
    required String date,
    required String time,
    required String guideName,
    required String guideImage,
    required String status,
    required List<String> actions,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.green),
                      SizedBox(width: 4),
                      Text(
                        location,
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(date),
                    SizedBox(width: 10),
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(time),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(guideImage),
                      radius: 16,
                    ),
                    SizedBox(width: 8),
                    Text(guideName),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: actions
                      .map((action) => _buildActionButton(action))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  

  Widget _buildActionButton(String label) {
    return OutlinedButton(
      onPressed: () {
        // Handle button action
      },
      child: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.green,
        side: BorderSide(color: Colors.green),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }


  
}
