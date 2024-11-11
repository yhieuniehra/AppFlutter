import 'package:flutter/material.dart';

class TripHome extends StatelessWidget {
  const TripHome({super.key});

  Widget _buildHead(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/Mask Group.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          height: 250,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            iconSize: 40,
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
        Positioned(
          top: 70,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Explore',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_sharp, size: 20, color: Colors.white),
                      Text('Da Nang', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.cloudy_snowing, color: Colors.white, size: 35),
                      SizedBox(width: 4),
                      Text('26°C', style: TextStyle(color: Colors.white, fontSize: 24)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Hi, where do you want to guide?',
              prefixIcon: const Icon(Icons.search, color: Color(0xff777777)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGuideCard(String imagePath, String name, String from, String date, String location) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(from, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(date, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_pin, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(location, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Home'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHead(context),
            const SizedBox(height: 20),
            _buildSectionHeader('Finding a Guide'),
            const SizedBox(height: 10),
            _buildGuideCard('assets/anh1.jpg', 'Yoo Jin', 'from Korea', 'Jan 30, 2020', 'Danang, Vietnam'),
            const SizedBox(height: 20),
            _buildGuideCard('assets/anh2.jpg', 'Jon Mark', 'from Spain', 'Jan 30, 2020', 'Danang, Vietnam'),
            const SizedBox(height: 20),
            _buildGuideCard('assets/anh3.jpg', 'Lynd Nguyen', 'from US', 'Jan 30, 2020', 'Danang, Vietnam'),
            const SizedBox(height: 20),
            _buildGuideCard('assets/anh4.jpg', 'Patrick', 'from Italy', 'Jan 30, 2020', 'Danang, Vietnam'),
            const SizedBox(height: 35),
            _buildSectionHeader('Guides in Danang'),
          ],
        ),
      ),
      backgroundColor: Colors.white,  // Đặt màu nền của body thành trắng
    );
  }
}
