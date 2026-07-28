import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms & Conditions')),
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
            _buildSectionTitle('1. Acceptance of Terms'),
            const SizedBox(height: 8),
            const Text(
              'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('2. Use License'),
            const SizedBox(height: 8),
            const Text(
              'Permission is granted to temporarily use this application for personal, non-commercial transitory viewing only.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('3. User Account'),
            const SizedBox(height: 8),
            const Text(
              'When you create an account with us, you must provide accurate and complete information. You are responsible for safeguarding your account.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('4. Products and Services'),
            const SizedBox(height: 8),
            const Text(
              'All products and services are subject to availability. We reserve the right to discontinue any products at any time.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('5. Pricing and Payment'),
            const SizedBox(height: 8),
            const Text(
              'Prices for our products are subject to change without notice. We reserve the right to modify or discontinue services without notice.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('6. Returns and Refunds'),
            const SizedBox(height: 8),
            const Text(
              'Our return policy lasts 30 days. If 30 days have gone by since your purchase, unfortunately we can\'t offer you a refund.',
              style: TextStyle(fontSize: 16),
            ),
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
}
