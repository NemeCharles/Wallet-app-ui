import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/utilities.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void onTap(int index) {
   setState(() {
     _selectedIndex = index;
   });
  }
  final _controller = PageController(viewportFraction: 0.8, keepPage: true);

  // colors 746af4 9ddcf5 9ab9fe aca7ff 8fd5f9 ff96b3 9ba2c6 a7a0ff

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFFF1F8FF),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.095,
        child: BottomNavigationBar(
          unselectedItemColor: const Color(0XFF9BA2C6),
          selectedItemColor: const Color(0XFFFF96B3).withOpacity(0.8),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, size: size.width * 0.104),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon:  Icon(Icons.settings, size: size.width * 0.104,),
              label: 'Settings'
            )
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: const Color(0XFFFF96B3).withOpacity(0.8),
        onPressed: null,
        child: const Icon(Icons.add,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text('My',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text('Cards',
                        style: TextStyle(
                          fontSize: 40
                        ),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0XFFE4ECFB)),
                        shape: MaterialStateProperty.all<CircleBorder>(const CircleBorder()),
                        fixedSize: MaterialStateProperty.all<Size>(const Size(10, 10))
                      ),
                      child: const Icon(Icons.add,
                        size: 20,
                        color: Colors.black,
                      )
                  )
                ],
              ),
            ),
            const SizedBox(height: 25,),
            SizedBox(
              height: size.height * 0.24,
              child: PageView(
                controller: _controller,
                children: const [
                  CreditCard(color: Color(0XFF746AF4),),
                  CreditCard(color: Color(0XFF9DDCF5),),
                  CreditCard(color: Color(0XFF746AF4),)
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                dotColor: Colors.grey.withOpacity(0.6),
                activeDotColor: Colors.grey
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Buttons(text: 'Send', icon: 'money'),
                  Buttons(text: 'Pay', icon: 'wallet'),
                  Buttons(text: 'Bills', icon: 'bills')
                ],
              ),
            ),
            const SizedBox(height: 30,),
            TransactionTiles(
              title: 'Statistics',
              subtitle: 'Payment and Income',
              color: const Color(0XFFA7A0FF),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.asset('icons/stats1.png'),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            TransactionTiles(
              title: 'Transactions',
              subtitle: 'Transaction history',
              color: const Color(0XFF86CCEE),
              child: Image.asset('icons/transaction1.png'),
            )
          ],
        ),
      ),
    );
  }
}

