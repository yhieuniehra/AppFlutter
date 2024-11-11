import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneController = TextEditingController();
  final _languagesController = TextEditingController();
  final _introductionController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _phoneController.dispose();
    _languagesController.dispose();
    _introductionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 249, 249),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 206, 166, 1),
        elevation: 0,
        toolbarHeight: 200,
        centerTitle: true,
        title: const Text(
          'Welcome, Tuan!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Please finish your profile so that\nTravelers can find you easily!',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: _buildStepIndicator("Background Info", isActive: true),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: _buildStepIndicator("Fee & Time", isActive: false),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _addressController,
                  label: "Address",
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _cityController,
                        label: "City",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(
                        controller: _countryController,
                        label: "Country",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _phoneController,
                  label: "Phone number",
                  prefix: Text(
                    '(+84) ',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                const SizedBox(height: 20),
                _buildPhotoUploadButton("Guide License"),
                const SizedBox(height: 10),
                _buildPhotoUploadButton("Identity Card"),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _languagesController,
                  label: "Languages",
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _introductionController,
                  label: "Introduction",
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                _buildPhotoUploadButton("Video Introduction (Optional)", isVideo: true),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/navigation');
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 206, 166, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    
                    child: const Text(
                     
                      'NEXT',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator(String title, {required bool isActive}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isActive ? const Color.fromRGBO(0, 206, 166, 1) : Colors.grey[300],
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    Widget? prefix,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[100],
        prefix: prefix,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }

  Widget _buildPhotoUploadButton(String label, {bool isVideo = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            // Xử lý chọn hình ảnh hoặc video
          },
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isVideo ? Icons.videocam : Icons.camera_alt,
                    color: Colors.teal,
                  ),
                  Text(
                    'Upload ${isVideo ? "Video" : "Photo"}',
                    style: TextStyle(color: Colors.teal),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
