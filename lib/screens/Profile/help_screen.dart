import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHelpCard(
            icon: Icons.shopping_bag,
            title: 'Order Issues',
            subtitle: 'Problems with your orders',
          ),
          _buildHelpCard(
            icon: Icons.payment,
            title: 'Payment & Refunds',
            subtitle: 'Payment methods and refund queries',
          ),
          _buildHelpCard(
            icon: Icons.local_shipping,
            title: 'Delivery',
            subtitle: 'Tracking and delivery questions',
          ),
          _buildHelpCard(
            icon: Icons.account_circle,
            title: 'Account Help',
            subtitle: 'Login and account issues',
          ),
          _buildHelpCard(
            icon: Icons.security,
            title: 'Security',
            subtitle: 'Privacy and security concerns',
          ),

          const SizedBox(height: 24),
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildFAQItem(
            question: 'How can I track my order?',
            answer: 'You can track your order from the My Orders section.',
          ),
          _buildFAQItem(
            question: 'What payment methods do you accept?',
            answer:
                'We accept credit cards, debit cards, and popular digital wallets.',
          ),
          _buildFAQItem(
            question: 'How long does delivery take?',
            answer: 'Delivery typically takes 3-5 business days.',
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children: [
          Padding(padding: const EdgeInsets.all(16), child: Text(answer)),
        ],
      ),
    );
  }
}
