import 'package:flutter/material.dart';
import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {

  late bool _isIncomeSelected = true; // Track selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.lightGreyBg2
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  UiText(
                      text: "Notification",
                      textColor: AppColors.darkTxt3,
                      fontSize: 17,
                      fontWeight: FontWeight.w400
                  ),
                  Spacer(),
                  Row(
                    children: [
                      UiText(text: "Sort by", textColor: AppColors.darkTxt3, fontSize: 14, fontWeight: FontWeight.w400),
                      Icon(Icons.arrow_drop_down, size: 20, color: AppColors.darkTxt3,)
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.iconGrey,
                  width: 1.5
                )
              )
            ),
            child: Image(
                image: AssetImage("assets/creditCard.png"),
              fit: BoxFit.cover,
            ),
          ),
          _buildTabSection(),
          _isIncomeSelected ? _buildIncomeList() : _buildTransactionList(),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: _buildTabItem('Income', _isIncomeSelected, () {
              setState(() {
                _isIncomeSelected = true;
              });
            }),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: _buildTabItem('Transaction', !_isIncomeSelected, () {
              setState(() {
                _isIncomeSelected = false;
              });
            }),
          ),
        ),
        
      ],
    );
  }

  Widget _buildTabItem(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          SizedBox(height: 20,),
          isSelected ?
            Container(
              height: 1.5,
              width: double.maxFinite,
              color: AppColors.primaryYellowColor,
            ) : Container(
            height: 1.5,
            width: double.maxFinite,
            color: AppColors.iconGrey,
          )
        ],
      ),
    );
  }

  Widget _buildIncomeList() {
    final incomeItems = [
      TransactionItem('Income 1', 'from Source 1', 'Today', 100),
      TransactionItem('Income 2', 'from Source 2', 'Yesterday', 150),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 0),
      itemCount: incomeItems.length,
      itemBuilder: (context, index) {
        final item = incomeItems[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/femaleReviewer.jpg'),
            radius: 24,
          ),
          title: Text(item.title),
          subtitle: Text('${item.subtitle}\n${item.date}'),
          trailing: Text(
            '+ ${item.amount}',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  Widget _buildTransactionList() {
    final transactions = [
      TransactionItem('Protein purchase (1KG)', 'from Tanbir Ahmed', '20 mins ago', 50),
      TransactionItem('Protein purchase (1KG)', 'from Obi Chinwe', '12 Mar 2021', 123),
      TransactionItem('Habanero pepper purchase', 'from Adams Kalu', '12 Mar 2021', 80),
      TransactionItem('Protein purchase (1KG)', 'from Tanbir Ahmed', '12 Mar 2021', 50),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 0),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final item = transactions[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/femaleReviewer.jpg'),
            radius: 24,
          ),
          title: Text(item.title),
          subtitle: Text('${item.subtitle}\n${item.date}'),
          trailing: Text(
            '+ ${item.amount}',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}

class TransactionItem {
  final String title;
  final String subtitle;
  final String date;
  final int amount;

  TransactionItem(this.title, this.subtitle, this.date, this.amount);
}