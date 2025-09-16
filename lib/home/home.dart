
import 'package:flutter/material.dart';
import 'package:flutter_application_1/account/account.dart';
import 'package:flutter_application_1/explore/explore.dart';
import 'package:flutter_application_1/home/home_cubit.dart';
import 'package:flutter_application_1/home/home_state.dart';
import 'package:flutter_application_1/productDetails/productDetails.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/CustomBottomBar.dart';




class Home extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create:(context) => HomeCubit()..loadData(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if(state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is HomeLoaded) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: 
                            SizedBox(
                              width: 24,
                              height: 30,
                              child: Image.asset('assets/images/logo_ca_rot.png')
                            )
                        ),
                
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: SizedBox(
                                  width: 16,
                                  height:20,
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/AddressIcon.png',
                                      ),
                                  ),
                                ),
                              ),
                                  
                              Text(
                                'Dhaka, Banassre',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
              
                        //search
                        Container( 
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: SizedBox(
                                    width: 20,
                                    height:24,
                                    child: Image.asset(
                                      'assets/images/SearchIcon.png',
                                    )
                                  ),
                                ),
              
                                //expanded là widget để mở rộng child chiếm toàn bộ không gian
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search Store',
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                
                        ),
              
                        //Discount
                        // SizedBox(
                        //   height: 150,
                        //   child: ListView.builder(
                        //     //shrinkwrap true để list item lấy theo kích thước của
                        //     //widget con
                        //     shrinkWrap: true,
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: items.length,
                        //     itemBuilder: (context, index) {
                        //       final item = items[index];
                        //       return Center(
                        //         child: Image.asset(item),
                        //       );
                        //     }
                        //   ),
                        // ),
                        SizedBox(
                          height: 150,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.itemsDiscount.length,
                            itemBuilder: (context, index) {
                              final item = state.itemsDiscount[index];
                              return Center(
                                child: Image.asset(item),
                              );
                            }
                          ),
                        ),
              
                        //Exclusive Offer
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Exclusive Offer',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          
                              TextButton(
                                onPressed: () {}, 
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                        
                        //list item Exclusive Offer
                        SizedBox(
                          height: 255,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.itemsExclusive.length,
                            itemBuilder: (context, index) {
                              final item = state.itemsExclusive[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> productdetails(null, item)));
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  width: 170,
                                  child: Column(
                                    children: [
                                      //ảnh
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                                        child: SizedBox(
                                          height: 65,
                                          child: Image.asset(item.imagePath),
                                        ),
                                      ),
                                  
                                      //tên
                                      Align(
                                        alignment: AlignmentGeometry.centerLeft,
                                        child: Text(
                                          textAlign: TextAlign.right,
                                          item.name,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                  
                                      //thông tin
                                      Align(
                                        alignment: AlignmentGeometry.centerLeft,
                                        child: Text(
                                          item.unit,
                                          style: TextStyle(
                                            color: Colors.grey
                                          ),
                                        ),
                                      ),
                                  
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$${item.price.toStringAsFixed(2)}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                                                
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Colors.green,
                                              ),
                                              child: IconButton(
                                                onPressed: () {}, 
                                                icon: ImageIcon(
                                                  AssetImage('assets/images/plusButton.png'),
                                                  color: Colors.white,
                                                )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                        
                        //Best selling
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Best Selling',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          
                              TextButton(
                                onPressed: () {}, 
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
              
                        //list item best selling
                        SizedBox(
                          height: 255,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.itemsBS.length,
                            itemBuilder: (context, index) {
                              final item = state.itemsBS[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> productdetails(null, item)));
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  width: 170,
                                  child: Column(
                                    children: [
                                      //ảnh
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                                        child: SizedBox(
                                          height: 65,
                                          child: Image.asset(item.imagePath),
                                        ),
                                      ),
                                  
                                      //tên
                                      Align(
                                        alignment: AlignmentGeometry.centerLeft,
                                        child: Text(
                                          textAlign: TextAlign.right,
                                          item.name,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                  
                                      //thông tin
                                      Align(
                                        alignment: AlignmentGeometry.centerLeft,
                                        child: Text(
                                          item.unit,
                                          style: TextStyle(
                                            color: Colors.grey
                                          ),
                                        ),
                                      ),
                                  
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$${item.price.toStringAsFixed(2)}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                                                
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Colors.green,
                                              ),
                                              child: IconButton(
                                                onPressed: () {}, 
                                                icon: ImageIcon(
                                                  AssetImage('assets/images/plusButton.png'),
                                                  color: Colors.white,
                                                )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      
                        //Groceries
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Groceries',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          
                              TextButton(
                                onPressed: () {}, 
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                        
                        //list item Groceries
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                          child: SizedBox(
                            height: 105,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.itemsGroceries.length,
                              itemBuilder: (context, index) {
                                final item = state.itemsGroceries[index];
                                return Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  padding: const EdgeInsets.all(15.0),
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: item.color
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(item.imagePath),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                                          child: Text(
                                            item.name,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        
                        //list item
                        SizedBox(
                          height: 255,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.items.length,
                            itemBuilder: (context, index) {
                              final item = state.items[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> productdetails(null, item)));
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  width: 170,
                                  child: Column(
                                    children: [
                                      //ảnh
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                                        child: SizedBox(
                                          height: 65,
                                          child: Image.asset(item.imagePath),
                                        ),
                                      ),
                                  
                                      //tên
                                      Align(
                                        alignment: AlignmentGeometry.centerLeft,
                                        child: Text(
                                          textAlign: TextAlign.right,
                                          item.name,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                  
                                      //thông tin
                                      Align(
                                        alignment: AlignmentGeometry.centerLeft,
                                        child: Text(
                                          item.unit,
                                          style: TextStyle(
                                            color: Colors.grey
                                          ),
                                        ),
                                      ),
                                  
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$${item.price.toStringAsFixed(2)}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                                                
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Colors.green,
                                              ),
                                              child: IconButton(
                                                onPressed: () {}, 
                                                icon: ImageIcon(
                                                  AssetImage('assets/images/plusButton.png'),
                                                  color: Colors.white,
                                                )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),

      //bottom bar
      bottomNavigationBar: CustomBottomBar(currentIndex: _selectedIndex, onTap: _onBottomBarClick,)
    );
  }

  void _onBottomBarClick(int index) {
    if(index == 0) {

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