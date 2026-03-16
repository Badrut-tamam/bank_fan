import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  String? _selectedAmount;
  final List<String> _amounts = ['10', '25', '50', '100', '200', '500'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Top-Up'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppTheme.textColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextField(
              label: 'Phone Number',
              prefixIcon: Icons.phone_android,
            ),
            const SizedBox(height: 32),
            const Text(
              'Select Amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.2,
              ),
              itemCount: _amounts.length,
              itemBuilder: (context, index) {
                final amount = _amounts[index];
                final isSelected = _selectedAmount == amount;
                return InkWell(
                  onTap: () => setState(() => _selectedAmount = amount),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? AppTheme.primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.primaryColor
                            : Colors.grey[300]!,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppTheme.primaryColor.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      '\$$amount',
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppTheme.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 48),
            PrimaryButton(
              text: 'Confirm Payment',
              onPressed: _selectedAmount == null
                  ? null
                  : () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Top-up of \$${_selectedAmount} Successful!',
                          ),
                          backgroundColor: AppTheme.primaryColor,
                        ),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
