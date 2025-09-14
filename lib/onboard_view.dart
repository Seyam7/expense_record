import 'package:expense_record/home_view.dart';
import 'package:expense_record/theme/colors.dart';
import 'package:flutter/material.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              /*AppColors.grey,
              AppColors.grey,*/
              AppColors.darkGreen.withOpacity(.2),
              AppColors.black
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      size: 50,
                      color: AppColors.lightGreen.withOpacity(.8),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Expense Record',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGreen.withOpacity(.8),
                      ),
                    ),
                    SizedBox(height: 30),
                    ListTile(
                      leading: Icon(Icons.wallet, color: Colors.purple.shade100),
                      title: Text(
                        'Add your subscription',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Add cost, date, due date, reminder, cycle and more details of your subscription.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.calculate, color: Colors.amber),
                      title: Text(
                        'Calculate your spending',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Calculate the total spending based on subscription costs and the selected time frame.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications, color: Colors.green),
                      title: Text(
                        'On-time Reminder',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Get notified when your bill is due with your added notes.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightGreen.withOpacity(.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: Text('Let\'s Get Started',style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
