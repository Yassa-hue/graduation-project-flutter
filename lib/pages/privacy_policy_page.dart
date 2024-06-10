import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        backgroundColor: PRIMARY_COLOR,
        iconTheme: IconThemeData(
            color: Colors.white), // Ensure the back arrow is white
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Introduction'),
              _buildSectionContent(
                'We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data.',
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Data Collection'),
              _buildSectionContent(
                'We collect personal information that you provide to us directly, such as when you register, make a donation, or contact us for support. This information may include your name, email address, phone number, and payment information.',
              ),
              _buildSectionContent(
                'We also collect information automatically as you navigate through our app. This includes usage details, IP addresses, and information collected through cookies and other tracking technologies.',
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Data Usage'),
              _buildSectionContent(
                'We use the information we collect to operate and maintain our services, process transactions, send periodic emails, and improve our app. We may also use your information to communicate with you about updates, promotions, and events.',
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Data Sharing'),
              _buildSectionContent(
                'We do not sell, trade, or otherwise transfer to outside parties your Personally Identifiable Information unless we provide users with advance notice. This does not include website hosting partners and other parties who assist us in operating our app, conducting our business, or serving our users, so long as those parties agree to keep this information confidential.',
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Security'),
              _buildSectionContent(
                'We implement a variety of security measures to maintain the safety of your personal information. However, please note that no method of transmission over the Internet or method of electronic storage is 100% secure.',
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Changes to This Policy'),
              _buildSectionContent(
                'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.',
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Contact Us'),
              _buildSectionContent(
                'If you have any questions about this Privacy Policy, please contact us at support@nonprofitnexus.com.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }
}
