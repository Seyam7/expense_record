import 'package:expense_record/theme/colors.dart';
import 'package:expense_record/widgets/date_time_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.darkGreen.withOpacity(.2),
                  AppColors.black
                ],
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                // Icon and app name
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      size: 30,
                      color: AppColors.lightGreen.withOpacity(.8),
                    ),
                    Text(" Expense Record", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGreen.withOpacity(.8)
                    ),),
                  ],
                ),

                // user name and search icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // user name and subscription
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ifty’s',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.greyWhite
                          ),
                        ),
                        Text(
                          'Subscriptions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),

                    // calculate icon
                    Icon(Icons.calculate_outlined, color: AppColors.lightGreen.withOpacity(.8)),
                  ],
                ),

                SizedBox(height: 20),

                Expanded(
                  child: ListView(
                    children: [
                      _expenseTile(
                        date: '14/09/2025',
                        amount: '100',
                      ),
                      _expenseTile(
                        date: '13/09/2025',
                        amount: '1200',
                      ),
                      _expenseTile(
                        date: '12/09/2025',
                        amount: '35',
                      ),
                    ],
                  ),
                ),

                // Custom floating action button bar
                /*Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        backgroundColor: AppColors.black,
                        child: Icon(Icons.home_outlined, color: AppColors.white),
                      ),
                      FloatingActionButton(
                        shape: CircleBorder(),
                        onPressed: () {},
                        backgroundColor: AppColors.lightGreen.withOpacity(.8),
                        child: Icon(Icons.add, color: AppColors.white),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        backgroundColor: AppColors.black,
                        child: Icon(Icons.settings_outlined, color: AppColors.white),
                      ),
                    ],
                  ),
                ),*/

                // floating action button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      backgroundColor: AppColors.lightGreen.withOpacity(.8),
                      shape: CircleBorder(),
                      onPressed: (){
                        String? selectedDate;
                        final TextEditingController amountController = TextEditingController();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: AppColors.grey,
                              title: const Text("Add Expense",style: TextStyle(color: AppColors.lightGreen),),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DateField(
                                    onDateSelected: (date) {
                                    selectedDate = date;
                                  },
                                  ),
                                  SizedBox(height: 12),
                                  TextField(
                                    controller: amountController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: "Amount",
                                      prefixIcon: Icon(Icons.currency_bitcoin_outlined, color: AppColors.darkGreen),
                                      labelStyle: TextStyle(color: AppColors.darkGreen),
                                      border: OutlineInputBorder(),
                                    ),
                                    style: TextStyle(color: AppColors.lightGreen),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context), // close dialog
                                  child: const Text("Cancel",style: TextStyle(color: AppColors.darkGreen),),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.darkGreen, // button background color
                                    foregroundColor: AppColors.white,    // text (and icon) color
                                  ),
                                  onPressed: () {
                                    final amount = amountController.text;
                                    debugPrint("📅 Date: $selectedDate");
                                    debugPrint("💰 Amount: $amount");

                                    Navigator.pop(context);
                                  },
                                  child: const Text("Save"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _expenseTile({
    required String date,
    required String amount,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.darkGreen.withOpacity(0.6), // Semi-transparent background
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            '৳$amount',
            style: TextStyle(
              color: AppColors.lightGreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
