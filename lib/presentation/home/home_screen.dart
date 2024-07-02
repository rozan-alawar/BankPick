import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'My Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            SizedBox(height: 20),
            _buildCardSection(),
            SizedBox(height: 20),
            _buildTransactionButtons(),
            SizedBox(height: 20),
            _buildTransactionList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                  'assets/profile.jpg'), // Add a profile image in assets folder
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome back,',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text(homeProvider.name,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildCardSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('4562 1122 4595 7852',
              style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('AR Jonson', style: TextStyle(color: Colors.white)),
              Text('Mastercard', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Exp: 24/2000', style: TextStyle(color: Colors.white)),
              Text('CVV: 6986', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTransactionButton(Icons.arrow_upward, 'Sent'),
        _buildTransactionButton(Icons.arrow_downward, 'Receive'),
        _buildTransactionButton(Icons.attach_money, 'Loan'),
        _buildTransactionButton(Icons.add, 'Topup'),
      ],
    );
  }

  Widget _buildTransactionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildTransactionList() {
    return Expanded(
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return ListView.builder(
            itemCount: homeProvider.transactions.length,
            itemBuilder: (context, index) {
              final transaction = homeProvider.transactions[index];
              return _buildTransactionItem(transaction.icon, transaction.title,
                  transaction.subtitle, transaction.amount);
            },
          );
        },
      ),
    );
  }

  Widget _buildTransactionItem(
      IconData icon, String title, String subtitle, String amount) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(amount,
          style: TextStyle(
              color: amount.startsWith('-') ? Colors.red : Colors.green)),
    );
  }
}
