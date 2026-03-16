import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppTheme.textColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.date_range_outlined),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterPill('All', true),
                  _buildFilterPill('Transfer', false),
                  _buildFilterPill('Payments', false),
                  _buildFilterPill('Top Up', false),
                  _buildFilterPill('Income', false),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: const [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 12),
                  TransactionItem(
                    title: 'Starbucks Coffee',
                    date: '10:45 AM',
                    amount: '12.50',
                    isIncome: false,
                    icon: Icons.coffee,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Yesterday',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 12),
                  TransactionItem(
                    title: 'Salary Deposit',
                    date: '09:00 AM',
                    amount: '4,500.00',
                    isIncome: true,
                    icon: Icons.account_balance,
                  ),
                  TransactionItem(
                    title: 'Groceries Store',
                    date: '04:20 PM',
                    amount: '85.40',
                    isIncome: false,
                    icon: Icons.shopping_cart_outlined,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '15 March 2024',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 12),
                  TransactionItem(
                    title: 'Netflix Subscription',
                    date: '11:15 PM',
                    amount: '15.99',
                    isIncome: false,
                    icon: Icons.movie_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterPill(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppTheme.primaryColor : Colors.grey[300]!,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : AppTheme.textColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}
