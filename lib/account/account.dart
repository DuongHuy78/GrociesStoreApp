import 'package:flutter/material.dart';
import 'package:flutter_application_1/account/cubit/account_state.dart';
import 'package:flutter_application_1/account/cubit/account_cubit.dart';
import 'package:flutter_application_1/cart/cart.dart';
import 'package:flutter_application_1/explore/explore.dart';
import 'package:flutter_application_1/home/home.dart';
import 'package:flutter_application_1/login/logIn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/AccountMenuItem.dart';
import '../widget/CustomBottomBar.dart';


class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account> {
  final int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit()..fetchAccount(),
      child: BlocListener<AccountCubit, AccountState>(
        listener: (context, state) {
          if(!state.isAccessActive) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LogIn()),
              (Route<dynamic> route) => false,
            );
          }
          
          if(state.generalError != '') {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Lỗi'),
                content: Text(state.generalError),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      context.read<AccountCubit>().clearError();
                    },
                    child: const Text('Đóng'),
                  ),
                ],
              ),
            );
          }
        },
        child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(15, 70, 15, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //icon, name user
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        width: 65,
                        height: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(25),
                          child: Image.asset(
                            state.avatarPath, 
                            fit: BoxFit.cover,
                          )
                        )
                      ),
              
                      Padding(
                        padding: EdgeInsetsGeometry.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  state.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                        
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/penIcon.png', height: 16,),
                                )
                              ],
                            ),
                        
                            //email
                            Text(
                              state.email,
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 87, 87, 87)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              
                  //details
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Column(
                        children: [
                          Divider(),
                          AccountMenuItem(
                            title: 'Orders',
                            iconPath: 'assets/images/ordersIcon.png',
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuItem(
                            title: 'My Details',
                            iconPath: 'assets/images/detailsIcon.png',
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuItem(
                            title: 'Delivery Address',
                            iconPath: 'assets/images/deliveryAddressIcon.png',
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuItem(
                            title: 'Payment Methods',
                            iconPath: 'assets/images/paymentIcon.png',
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuItem(
                            title: 'Promo Cord',
                            iconPath: 'assets/images/cardIcon.png',
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuItem(
                            title: 'Notifications',
                            iconPath: 'assets/images/notificationIcon.png',
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuItem(
                            title: 'Help',
                            iconPath: 'assets/images/helpIcon.png',
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuItem(
                            title: 'About',
                            iconPath: 'assets/images/aboutIcon.png',
                            onTap: () {},
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                
                  SizedBox(
                    width: double.infinity,
                    height: 67,
                    child: ElevatedButton(
                      // onPressed: () async{
                      //   Navigator.pushAndRemoveUntil(
                      //     context, 
                      //     MaterialPageRoute(builder: (context)=>LogIn()), 
                      //     (Route)=>false
                      //   );
                      // },
                      onPressed: () async {
                        final result = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Log out'),
                            content: const Text('Are you sure you want to log out?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        );
                        if (result == true) {
                          context.read<AccountCubit>().deleteToken();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Image.asset(
                              'assets/images/logOutIcon.png',
                              width: 19,
                              height: 19,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomBar(currentIndex: _selectedIndex, onTap: _onBottomBarClick),
          );
        },

      ),

      )
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
}