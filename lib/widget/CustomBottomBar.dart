import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget{
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //BottomNavigationBar mặc định chuyển sang chế độ shifting khi có >3 item 
      //— chế độ shifting ẩn nhãn unselected
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/shopButton.png'),
            ),
            label: 'Home',
          ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/exploreButton.png'),
          ),
          label: 'Explore',
        ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/cartButton.png'),
          ),
          label: 'Cart'
        ),
        const BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/traiTimChuaSang.png'),
          ),
          label: 'Favorite',
        ),
        const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/accountButton.png'),
            ),
            label: 'Account',
          ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      onTap: onTap,
    );
  }
}