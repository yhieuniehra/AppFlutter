import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationsScreen(),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'image': 'assets/anh1.jpg', // Replace with actual image URL or asset
      'title': 'Tuan Tran accepted your request for the trip in Danang, Vietnam on Jan 20, 2020',
      'date': 'Jan 16',
      'icon': Icons.verified_user, // Icon to indicate accepted request
      'iconColor': Colors.green,
    },
    {
      'image': 'assets/anh3.jpg', // Replace with actual image URL or asset
      'title': 'Emmy sent you an offer for the trip in Ho Chi Minh, Vietnam on Feb 12, 2020',
      'date': 'Jan 16',
      'icon': Icons.local_offer, // Icon to indicate offer
      'iconColor': Colors.orange,
    },
    {
      'image': null, // No profile image for app notification
      'title': 'Thanks! Your trip in Danang, Vietnam on Jan 20, 2020 has been finished. Please leave a review for the guide Tuan Tran.',
      'date': 'Jan 24',
      'icon': Icons.thumb_up, // Icon for leave review
      'iconColor': Colors.blue,
      'isReviewButton': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0), // Tăng chiều cao của AppBar ở đây
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Opacity(
            opacity: 0.7, // Bạn có thể thay đổi độ mờ của ảnh
            child: Image.asset(
              'assets/Mask Group.png',
              fit: BoxFit.cover, // Đảm bảo ảnh phủ hết không gian
            ),
          ),
          title: Align(
            alignment: Alignment.center, // Căn giữa chữ trong AppBar
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24, // Điều chỉnh kích thước chữ
                fontWeight: FontWeight.bold,
                color: Colors.white, // Màu chữ
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationItem(notification: notification);
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Map<String, dynamic> notification;

  NotificationItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: notification['image'] != null
          ? CircleAvatar(
              backgroundImage: AssetImage(notification['image']), // Dùng AssetImage cho ảnh tài nguyên
            )
          : CircleAvatar(
              backgroundColor: notification['iconColor'],
              child: Icon(
                notification['icon'],
                color: Colors.white,
              ),
            ),
      title: Text(
        notification['title'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(notification['date']),
      trailing: notification['isReviewButton'] == true
          ? ElevatedButton(
              onPressed: () {
                // Xử lý khi người dùng nhấn nút đánh giá
              },
              child: Text('Leave Review'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            )
            
          : null,
          
    );
    
  }
}
