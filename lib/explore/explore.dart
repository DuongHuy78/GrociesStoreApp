
import 'package:flutter/material.dart';
import 'package:flutter_application_1/account.dart';
import 'package:flutter_application_1/explore/explore_cubit.dart';
import 'package:flutter_application_1/explore/explore_state.dart';
import 'package:flutter_application_1/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/item.dart';
import '../widget/CustomBottomBar.dart';

class Explore extends StatefulWidget{
  @override
    State<Explore> createState() => _Explore();
}

class _Explore extends State<Explore> {

  int _selectedIndex = 1;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: BlocBuilder<ExploreCubit, ExploreState>(
            builder: (context, state) {
              if(state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SafeArea(
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
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return InkWell(
                          onTap: () => context.read<ExploreCubit>().loadData(),
                          child: Container(
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
                          ),
                        );
                      }
                    ),
            
                  ],
                ),
              ),
            );

            },
          ),
        ),
        bottomNavigationBar: CustomBottomBar(currentIndex: _selectedIndex, onTap: _onBottomBarClick)
      ),
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