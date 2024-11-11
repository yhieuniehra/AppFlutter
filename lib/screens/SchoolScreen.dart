import 'package:flutter/material.dart';
// ignore: unused_import
import 'TripInformationScreen.dart'; // Đảm bảo bạn đã import đúng màn hình

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200), // Tùy chỉnh chiều cao AppBar
        child: AppBar(
          title: Text("Guide Profile"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipRect(
            child: Container(
              height: 250,
              child: Image.asset(
                'assets/thu.png', // Thay thế bằng hình ảnh của bạn
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần hồ sơ
            Row(
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundImage: AssetImage(
                      'assets/tuan.png'), // Thay thế bằng hình ảnh của bạn
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tuan Tran",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text("4.5 Reviews"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.green),
                          SizedBox(width: 4),
                          Text("Danang, Vietnam"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 8.0,
                        children: [
                          Chip(label: Text("Vietnamese")),
                          Chip(label: Text("English")),
                          Chip(label: Text("Korean")),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Điều hướng đến TripInformationScreen khi nhấn nút
                    Navigator.pushNamed(context, '/tripinfo');
                  },
                  child: Text("CHOOSE THIS GUIDE"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Giới thiệu ngắn
            Text(
              "Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Hình ảnh với nút Play
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/tuan.png', // Thay thế bằng hình ảnh của bạn
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Icon(Icons.play_circle_outline, color: Colors.white, size: 50),
              ],
            ),
            SizedBox(height: 16),
            // Bảng giá
            DataTable(
              columns: [
                DataColumn(label: Text("Travelers")),
                DataColumn(label: Text("Price")),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("1 - 3 Travelers")),
                  DataCell(Text("\$10/hour"))
                ]),
                DataRow(cells: [
                  DataCell(Text("4 - 6 Travelers")),
                  DataCell(Text("\$14/hour"))
                ]),
                DataRow(cells: [
                  DataCell(Text("7 - 9 Travelers")),
                  DataCell(Text("\$17/hour"))
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
