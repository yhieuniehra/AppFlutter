import 'package:flutter/material.dart';

class TripDetailsWidget extends StatelessWidget {
  Widget _buildcarrrr(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with image and icons
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/city_image.jpg', // Replace with your image asset
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    Text(
                      "Ho Chi Minh, Vietnam",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with your image asset
                ),
              ),
              Positioned(
                right: 40,
                bottom: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.7),
                  child: Text(
                    "+3",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Details Section
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date", style: TextStyle(fontSize: 16)),
                    Text("Feb 2, 2020", style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Time", style: TextStyle(fontSize: 16)),
                    Text("8:00AM - 10:00AM", style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Number of Travelers", style: TextStyle(fontSize: 16)),
                    Text("2", style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 8),
                Text("Attractions", style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  children: [
                    Chip(
                      avatar: Icon(Icons.location_on, color: Colors.green),
                      label: Text("Ho Guom"),
                    ),
                    Chip(
                      avatar: Icon(Icons.location_on, color: Colors.green),
                      label: Text("Ho Hoan Kiem"),
                    ),
                    Chip(
                      avatar: Icon(Icons.location_on, color: Colors.green),
                      label: Text("Pho 12 Pho Kim Ma"),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Fee", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("\$20.00", style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Offers Section
          Text("Offers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          OfferTile(
            profileImage: 'assets/offer_profile1.jpg', // Replace with your image asset
            name: "Khai Ho",
            rating: 5,
            reviews: 123,
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
            fee: "\$10/hour",
          ),
          OfferTile(
            profileImage: 'assets/offer_profile2.jpg', // Replace with your image asset
            name: "Tran Thao",
            rating: 4.5,
            reviews: 6,
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            fee: "\$8/hour",
          ),
          OfferTile(
            profileImage: 'assets/offer_profile3.jpg', // Replace with your image asset
            name: "Hennry",
            rating: 4.7,
            reviews: 79,
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.",
            fee: "\$12/hour",
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// Custom widget for Offer Tile
class OfferTile extends StatelessWidget {
  final String profileImage;
  final String name;
  final double rating;
  final int reviews;
  final String description;
  final String fee;

  OfferTile({
    required this.profileImage,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.fee,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImage),
              radius: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text("$rating"),
                      Text(" ($reviews Reviews)", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(description, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("Offer fee: $fee", style: TextStyle(color: Colors.teal)),
                ],
              ),
            ),
            Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}

// Main application to test the widget
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Trip Details")),
      body: TripDetailsWidget(), // Use the widget here
    ),
  ));
}
