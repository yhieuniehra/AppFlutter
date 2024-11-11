import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TourDetailsScreen(),
    );
  }
}

class TourDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('assets/ho.png', // Replace with your image asset
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover),
                Positioned(
                  top: 180,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Da Nang - Ba Na - Hoi An',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$400.00',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$450.00',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text(
                        '4.5',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text('(145 Reviews)'),
                      Spacer(),
                      Text(
                        'Provider: dulichviet',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildSummarySection(),
                  SizedBox(height: 20),
                  _buildScheduleSection(),
                  SizedBox(height: 20),
                  _buildPriceSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle booking action
          },
          child: Text('BOOK THIS TOUR'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(0, 206, 166, 1),
            padding: EdgeInsets.symmetric(vertical: 16),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          _buildSummaryItem('Itinerary', 'Da Nang - Ba Na - Hoi An'),
          _buildSummaryItem('Duration', '2 days, 2 nights'),
          _buildSummaryItem('Departure Date', 'Feb 12'),
          _buildSummaryItem('Departure Place', 'Ho Chi Minh'),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(content)),
        ],
      ),
    );
  }

  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Schedule',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.green,
                tabs: [
                  Tab(text: 'Day 1'),
                  Tab(text: 'Day 2'),
                ],
              ),
              Container(
                height: 200,
                child: TabBarView(
                  children: [
                    _buildDaySchedule('Ho Chi Minh - Da Nang', [
                      '6:00AM - Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      '10:00AM - Lorem Ipsum is simply dummy text.',
                      '1:00PM - Lorem Ipsum is simply dummy text.',
                      '8:00PM - Lorem Ipsum is simply dummy text.',
                    ]),
                    _buildDaySchedule('Da Nang - Hoi An', [
                      '7:00AM - Another day\'s schedule...',
                      '12:00PM - Lunch and free time.',
                      '3:00PM - Lorem Ipsum is simply dummy text.',
                      '7:00PM - Dinner and rest.',
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDaySchedule(String title, List<String> activities) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ...activities.map((activity) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(Icons.radio_button_checked,
                        color: Colors.green, size: 16),
                    SizedBox(width: 10),
                    Expanded(child: Text(activity)),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Table(
          border: TableBorder.all(color: Colors.grey),
          children: [
            _buildPriceRow('Adult (>10 years old)', '\$400.00'),
            _buildPriceRow('Child (5 - 10 years old)', '\$320.00'),
            _buildPriceRow('Child (<5 years old)', 'Free'),
          ],
        ),
      ],
    );
  }

  TableRow _buildPriceRow(String label, String price) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(price, textAlign: TextAlign.end),
        ),
      ],
    );
  }
}
