import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppTheme.textColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Transfer Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTransferOption(
                    context,
                    Icons.account_balance,
                    'Same Bank',
                    true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTransferOption(
                    context,
                    Icons.account_balance_outlined,
                    'Other Bank',
                    false,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTransferOption(
                    context,
                    Icons.qr_code,
                    'QR Transfer',
                    false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const CustomTextField(
              label: 'Account Number',
              prefixIcon: Icons.numbers,
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              label: 'Recipient Name',
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              label: 'Amount',
              prefixIcon: Icons.attach_money,
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              label: 'Notes (Optional)',
              prefixIcon: Icons.notes,
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              text: 'Confirm Transfer',
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Transfer Successful!'),
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

  Widget _buildTransferOption(
    BuildContext context,
    IconData icon,
    String label,
    bool isSelected,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppTheme.primaryColor : Colors.grey[300]!,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : AppTheme.primaryColor,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppTheme.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
