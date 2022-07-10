import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard( {
    Key? key, required this.color,
  }) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                  alignment: Alignment.topRight,
                  child: CardTexts(text: 'VISA', color: Color(0XFF9AB9FE), fontSize: 30)
              ),
              const CardTexts(text: 'Balance', color: Color(0XFFFFFFFF), fontSize: 17),
              const SizedBox(height: 5,),
              const CardTexts(text: '\$5,250.20', color: Color(0XFFFFFFFF), fontSize: 47,),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CardTexts(text: '**** 3456', color: Color(0XFFFFFFFF), fontSize: 24),
                  CardTexts(text: '10/04', color: Color(0XFFFFFFFF), fontSize: 24)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class CardTexts extends StatelessWidget {
  const CardTexts({
    Key? key, required this.text, required this.color, required this.fontSize,
  }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: fontSize,
        color: color
      ),
    );
  }
}


class Buttons extends StatelessWidget {
  const Buttons({
    Key? key, required this.text, required this.icon
  }) : super(key: key);

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          child: Container(
            height: size.width * 0.234,
            width: size.width * 0.234,
            decoration: BoxDecoration(
                color: const Color(0XFFF1F8FF),
                borderRadius: BorderRadius.circular(25),
                boxShadow:  [
                  BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                    color: Colors.black.withOpacity(0.1),
                  ),
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 0.6, color: const Color(0XFFC8C7DA))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 0.6, color: const Color(0XFFC8C7DA))
                    ),
                    child: Image.asset('icons/$icon.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: Color(0XFFB6BAD7)
          ),
        )
      ],
    );
  }
}


class TransactionTiles extends StatelessWidget {
  const TransactionTiles({
    Key? key, required this.title, required this.subtitle, required this.color, required this.child,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      // color:
                      gradient:LinearGradient(
                          colors: [
                            color.withOpacity(0.6),
                            color
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      )
                  ),
                  child: child
              ),
              const SizedBox(width: 15,),
              SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(subtitle,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Color(0XFFC8C7DA)
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, size: 20, color: Color(0XFFC8C7DA),)
        ],
      ),
    );
  }
}