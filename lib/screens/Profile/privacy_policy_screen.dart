import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last updated: December 2024',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('1. Information We Collect'),
            const SizedBox(height: 8),
            const Text(
              'We collect information you provide directly to us, including:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            _buildBulletPoint(
              'Personal information (name, email, phone number)',
            ),
            _buildBulletPoint('Payment information'),
            _buildBulletPoint('Device information'),
            _buildBulletPoint('Usage data and analytics'),

            const SizedBox(height: 24),
            _buildSectionTitle('2. How We Use Your Information'),
            const SizedBox(height: 8),
            _buildBulletPoint('To provide and maintain our service'),
            _buildBulletPoint('To process your transactions'),
            _buildBulletPoint('To send you updates and promotional materials'),
            _buildBulletPoint('To improve our app and user experience'),

            const SizedBox(height: 24),
            _buildSectionTitle('3. Data Security'),
            const Text(
              'We implement appropriate security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('4. Your Rights'),
            _buildBulletPoint('Right to access your personal data'),
            _buildBulletPoint('Right to rectification'),
            _buildBulletPoint('Right to erasure'),
            _buildBulletPoint('Right to restrict processing'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
