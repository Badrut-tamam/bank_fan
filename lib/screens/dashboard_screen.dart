import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';
import 'transfer_screen.dart';
import 'bill_payment_screen.dart';
import 'topup_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    const HistoryScreen(),
    const Center(child: Text('Card Management Screen')),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            activeIcon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning,',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: AppTheme.secondaryColor,
                  child: Icon(Icons.person, color: AppTheme.primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppTheme.cardGradient,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$12,450.80',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '**** **** **** 4582',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 24,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                QuickActionItem(
                  label: 'Transfer',
                  icon: Icons.swap_horiz,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransferScreen(),
                    ),
                  ),
                ),
                QuickActionItem(
                  label: 'Pay Bills',
                  icon: Icons.receipt_long_outlined,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BillPaymentScreen(),
                    ),
                  ),
                ),
                QuickActionItem(
                  label: 'Top Up',
                  icon: Icons.account_balance_wallet_outlined,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TopUpScreen(),
                    ),
                  ),
                ),
                QuickActionItem(
                  label: 'QR Pay',
                  icon: Icons.qr_code_scanner,
                  onTap: () {},
                ),
              ],
            ),
            const SectionHeader(
              title: 'Recent Transactions',
              onActionPressed: null,
            ),
            const TransactionItem(
              title: 'Starbucks Coffee',
              date: 'Today, 10:45 AM',
              amount: '12.50',
              isIncome: false,
              icon: Icons.coffee,
            ),
            const TransactionItem(
              title: 'Salary Deposit',
              date: 'Yesterday, 09:00 AM',
              amount: '4,500.00',
              isIncome: true,
              icon: Icons.account_balance,
            ),
            const TransactionItem(
              title: 'Netflix Subscription',
              date: '15 Mar 2024',
              amount: '15.99',
              isIncome: false,
              icon: Icons.movie_outlined,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
