import "package:afram_project/Screens/Colors/colors.dart";
import "package:afram_project/Screens/Driver-Ui/provider/userProvider.dart";
import "package:afram_project/Screens/Driver-Ui/provider/withdraw_provider.dart";
import "package:afram_project/Screens/Reusables/largeButton.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../Reusables/UIText.dart";

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context);
    final withdrawProvider = Provider.of<WithdrawProvider>(context);

    return Consumer<WithdrawProvider>(builder: (context, withdrawProvider, child) {
      return Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                        text: "Withdraw",
                        textColor: AppColors.darkTxt3,
                        fontSize: 17,
                        fontWeight: FontWeight.w400
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Amount';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        controller: _amountController,
                        cursorColor: AppColors.greyTxt3,
                        decoration: InputDecoration(
                          labelText: "Amount",
                          labelStyle: TextStyle(
                            color: AppColors.greyTxt3,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greyTxt3,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: true,
                        cursorColor: AppColors.greyTxt3,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: AppColors.greyTxt3,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greyTxt3,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      UiText(
                          text: "Commission is not charged by the bank",
                          textColor: AppColors.greyTxt3,
                          fontSize: 13, fontWeight: FontWeight.w400
                      ),
                      Spacer(),
                      withdrawProvider.isLoading ? CircularProgressIndicator() :
                      LargeBtn(
                          btnText: "Withdraw", btnColor: AppColors.primaryYellowColor, onTap: (){
                            if(_formKey.currentState?.validate() ?? false){
                              _formKey.currentState?.save();
                              withdrawProvider.makeWithDrawal(context, userProvider.user!.id.toString(), _passwordController.text, _amountController.text);
                            }
                      }, btnTextColor: Colors.white)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
