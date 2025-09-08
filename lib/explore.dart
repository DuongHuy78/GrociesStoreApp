
import 'package:flutter/material.dart';
import 'package:flutter_application_1/account.dart';
import 'package:flutter_application_1/home.dart';
import 'model/item.dart';
import 'widget/CustomBottomBar.dart';

class Explore extends StatefulWidget{
  @override
    State<Explore> createState() => _Explore();
}

class _Explore extends State<Explore> {

  int _selectedIndex = 1;

  final List<itemExplore> _items = [
  itemExplore(
    name: 'Frash Fruits & Vegetable',
    imagePath: 'assets/images/fruits.png',
    color: const Color(0xFFE8F5E9),
  ),
  itemExplore(
    name: 'Cooking Oil & Ghee',
    imagePath: 'assets/images/oil.png',
    color: const Color(0xFFFFF3E0),
  ),
  itemExplore(
    name: 'Meat & Fish',
    imagePath: 'assets/images/meat.png',
    color: const Color(0xFFFCE4EC),
  ),
  itemExplore(
    name: 'Bakery & Snacks',
    imagePath: 'assets/images/bakery.png',
    color: const Color(0xFFEDE7F6),
  ),
  itemExplore(
    name: 'Dairy & Eggs',
    imagePath: 'assets/images/dairy.png',
    color: const Color(0xFFFFFDE7),
  ),
  itemExplore(
    name: 'Beverages',
    imagePath: 'assets/images/beverages.png',
    color: const Color(0xFFE3F2FD),
  ),
  itemExplore(
    name: 'Frash Fruits & Vegetable',
    imagePath: 'assets/images/fruits.png',
    color: const Color(0xFFE8F5E9),
  ),
  itemExplore(
    name: 'Cooking Oil & Ghee',
    imagePath: 'assets/images/oil.png',
    color: const Color(0xFFFFF3E0),
  ),
  itemExplore(
    name: 'Meat & Fish',
    imagePath: 'assets/images/meat.png',
    color: const Color(0xFFFCE4EC),
  ),
  itemExplore(
    name: 'Bakery & Snacks',
    imagePath: 'assets/images/bakery.png',
    color: const Color(0xFFEDE7F6),
  ),
  itemExplore(
    name: 'Dairy & Eggs',
    imagePath: 'assets/images/dairy.png',
    color: const Color(0xFFFFFDE7),
  ),
  itemExplore(
    name: 'Beverages',
    imagePath: 'assets/images/beverages.png',
    color: const Color(0xFFE3F2FD),
  ),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //text
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    'Find Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
        
                //search bar
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                        height: 20,
                        child: Image.asset('assets/images/SearchIcon.png')
                      ),
                  
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Store',
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  //Vì khi bạn không dùng physics: NeverScrollableScrollPhysics(), 
                  //mặc định GridView sẽ cuộn riêng và chiếm toàn bộ chiều cao còn lại 
                  //của parent (ở đây là Column trong SingleChildScrollView). 
                  //Nếu không đủ không gian, GridView chỉ hiển thị một phần và 
                  //phần còn lại bị ẩn, phải cuộn mới thấy.
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // số cột
                    crossAxisSpacing: 16, // khoảng cách các cột
                    mainAxisSpacing: 16,  //khoản cách giửa các hàng
                    childAspectRatio:0.8, // chỉnh tỷ lệ ngang/dọc
                  ), 
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(item.imagePath, height: 60),
                            const SizedBox(height: 12),
                            Text(
                              item.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                        ],
                      ),
                    );
                  }
                ),
        
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(currentIndex: _selectedIndex, onTap: _onBottomBarClick)
    );
  }
  void _onBottomBarClick(int index) {
    if(index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
    else if(index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Explore()));
    }
    else if(index == 2) {
      
    }
    else if(index == 3) {
      
    }
    else if(index == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Account()));
    }
  }
}