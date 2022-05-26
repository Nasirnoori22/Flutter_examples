import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';

class AwesomeCard extends StatelessWidget {
  const AwesomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome Card'),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: CreditCard(
              cardNumber: "5450 7879 4864 7854",
              cardExpiry: "10/25",
              cardHolderName: "Card Holder",
              cvv: "456",
              bankName: "Kabul Bank",
              cardType: CardType
                  .masterCard, // Optional if you want to override Card Type
              showBackSide: false,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: false,
              textExpDate: 'Exp. Date',
              textName: 'Name',
              textExpiry: 'MM/YY'),
        ),
      ),
    );
  }
}
