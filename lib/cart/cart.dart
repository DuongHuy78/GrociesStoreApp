import 'package:flutter/material.dart';
import 'package:flutter_application_1/account/account.dart';
import 'package:flutter_application_1/cart/cart_cubit.dart';
import 'package:flutter_application_1/cart/cart_state.dart';
import 'package:flutter_application_1/explore/explore.dart';
import 'package:flutter_application_1/foodType/foodType_cubit.dart';
import 'package:flutter_application_1/foodType/foodType_model.dart';
import 'package:flutter_application_1/foodType/foodType_state.dart';
import 'package:flutter_application_1/home/home.dart';
import 'package:flutter_application_1/item/item_cubit.dart';
import 'package:flutter_application_1/item/item_model.dart';
import 'package:flutter_application_1/item/item_state.dart';
import 'package:flutter_application_1/widget/CustomBottomBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Cart> {
  FoodType? selectedFoodType; 
  bool isShowFoodType = false;
  bool isShowItem = false;
  
  final int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CartCubit()),
          BlocProvider(create: (_) => ItemCubit()),
          BlocProvider(create: (_) => FoodTypeCubit()..loadFoodTypesData())
        ],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                  child:
                    const Text(
                      "My Cart",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                ),
              ),

              BlocBuilder<FoodTypeCubit, FoodTypeState>(
                builder: (context, state) {
                  if(state is FoodTypeLoadedState) {
                    final foodTypes = state.foodTypes;
                    return Container(
                      color: Colors.green,
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Food Type',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white
                                    ),
                                  ),
                          
                                  Text(
                                    (selectedFoodType != null) ? selectedFoodType!.name :'Select food type',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                          
                              IconButton(
                                onPressed: foodTypesToggle,
                                icon: isShowFoodType 
                                  ? Image.asset("assets/images/nutHuongLenTrang.png", height: 10, )
                                  : Image.asset("assets/images/nutHuongXuongTrang.png", height: 10,
                                ),
                              )
                            ],
                          ),
          
                          Column(
                            children: [
                              SizedBox(
                                height: isShowFoodType ? 300 : 0,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,       // bỏ hết padding mặc định
                                  primary: false,   
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount: foodTypes.length,
                                  itemBuilder: (context, index) {
                                    final item = foodTypes[index];
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 32,
                                              child: Image.asset(item.imagePath)
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                              child: Text(
                                                item.name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                              // 1. Ẩn dropdown FoodType
                                              setState((){
                                                isShowFoodType = false;
                                                selectedFoodType = item;
                                              } );
                                              // 2. load danh sách item theo type vừa chọn
                                              context.read<ItemCubit>().loadItemData(item);
                                            },                                        
                                            child: Text(
                                              'Select'
                                          )
                                        )
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
          
              BlocBuilder<ItemCubit, ItemState>(
                builder: (context, state) {
                  if(state is ItemLoadedState) {
                    final items = state.mockItemsForFoodType;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                          child: Row(
                            children: [
                              Text(
                                'Detail Information About ',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                state.selectedFoodType.name,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          ),
                        ),
          
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                          child: Text(
                            state.selectedFoodType.infor
                          ),
                        ),
                        Container(
                        width: 250,
                        color: Colors.green,
                        margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Item',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white
                                      ),
                                    ),
                            
                                    Text(
                                      'Select item',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                            
                                IconButton(
                                  onPressed: itemToggle,
                                  icon: isShowItem
                                      ? Image.asset("assets/images/nutHuongLenTrang.png", height: 10, )
                                      : Image.asset("assets/images/nutHuongXuongTrang.png", height: 10,
                                  ),
                                )
                              ],
                            ),
                        
                            SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: isShowItem ? 300 : 0,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,       // bỏ hết padding mặc định
                                      primary: false,   
                                      physics: AlwaysScrollableScrollPhysics(),
                                      itemCount: items.length,
                                      itemBuilder: (context, index) {
                                        final item = items[index];
                                        return InkWell(
                                          onTap: () {
                                            context.read<CartCubit>().insertItem(item);
                                          },
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                                                child: SizedBox(
                                                  height: 37,
                                                  child: Image.asset(item.imagePath,)
                                                ),
                                              ),
                                              Text(
                                                item.name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                }
              ),
          
              //hiển thị danh sách
              BlocBuilder<CartCubit, CartState>(
                builder: (ctx, state) {
                  if (state is CartLoadedState && state.myCarts.isNotEmpty) {
                    // gom nhóm theo foodType
                    final groups = <String, List<Item>>{};
                    for (var it in state.myCarts) {
                      groups.putIfAbsent(it.foodType.name, () => []).add(it);
                    }
          
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var entry in groups.entries) ...[
                            Text(
                              entry.key,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 8),
                            //duyệt từng phần tử con
                            for (var it in entry.value)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 32,
                                      child: Image.asset(it.imagePath),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(it.name, style: TextStyle(fontSize: 16)),
                                          Text(
                                            '\$${it.price.toStringAsFixed(2)}',
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: ImageIcon(
                                        AssetImage("assets/images/dauTru.png")
                                      ),
                                      onPressed: () => ctx.read<CartCubit>().decrement(it),
                                    ),
                                    // Text('${it.count}', style: TextStyle(fontSize: 16)),
                                    Container(
                                          width: 45,
                                          height: 45,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: Text(
                                            '${it.count}',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                    IconButton(
                                      icon: ImageIcon(
                                        AssetImage("assets/images/dauCong.png",)
                                      ),
                                      onPressed: () => ctx.read<CartCubit>().increment(it),
                                    ),

                                    // Row(
                                    //   children: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    //       child: IconButton(
                                    //         onPressed:() => ctx.read<CartCubit>().decrement(it),
                                    //         icon: ImageIcon(
                                    //           AssetImage('assets/images/dauTru.png'),
                                    //           size: 20,
                                    //           color: (context.read<CartCubit>().isCountMin(it.count))? Colors.grey: Colors.green,
                                    //         ),
                                    //       ),
                                    //     ),
                                        
                                        // Container(
                                        //   width: 45,
                                        //   height: 45,
                                        //   alignment: Alignment.center,
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(15),
                                        //     border: Border.all(color: Colors.grey),
                                        //   ),
                                        //   child: Text(
                                        //     '${it.count}',
                                        //     style: TextStyle(
                                        //       fontSize: 25,
                                        //       fontWeight: FontWeight.w600,
                                        //     ),
                                        //   ),
                                        // ),
                                        
                                    //     Padding(
                                    //       padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    //       child: IconButton(
                                    //         onPressed:() => ctx.read<CartCubit>().increment(it) ,
                                    //         icon: ImageIcon(
                                    //           AssetImage('assets/images/dauCong.png'),
                                    //           size: 20,
                                    //           color: Colors.green,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            Divider(color: Colors.green),
                          ]
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
    }
    else if(index == 3) {
      
    }
    else if(index == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Account()));
    }
  }

  void foodTypesToggle() {
    setState(() {
      isShowFoodType = !isShowFoodType;
    });
  }

  void itemToggle() {
    setState(() {
      isShowItem = !isShowItem;
    });
  }
}



