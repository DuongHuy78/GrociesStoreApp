
import 'package:flutter/material.dart';
import 'package:flutter_application_1/productDetails/productDetails_cubit.dart';
import 'package:flutter_application_1/productDetails/productDetails_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/item.dart';

class productdetails extends StatefulWidget{
  final item product;

  const productdetails(Key? key, this.product) : super(key: key); 
  @override
  State<productdetails> createState() => _productdetails();
}

class _productdetails extends State<productdetails>{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(widget.product),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            final cubit = context.read<ProductDetailsCubit>();
            final item p = state.product;
          
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity, // chiếm toàn chiều ngang,
                        height: 300,
                        child: Image(
                          image: AssetImage(widget.product.imagePath)
                        )
                      ),
                    
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: onBackButtonClick, 
                              icon: ImageIcon(
                                AssetImage('assets/images/logo_backButton.png'),
                              ),
                            ),
                    
                            IconButton(
                              onPressed: () {}, 
                              icon: ImageIcon(
                                AssetImage('assets/images/logo_export.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.product.name, 
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                    
                        IconButton(
                          onPressed: context.read<ProductDetailsCubit>().toggleFavorite, 
                          icon: ImageIcon(
                            AssetImage('assets/images/traiTimChuaSang.png'),
                            color: p.isLike? Colors.red:Colors.grey,
                            size: 23,
                          )
                        ),
                      ],
                    ),
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Text(p.unit),
                  ),
                    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Phần bên trái
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: IconButton(
                              onPressed: cubit.decrement ,
                              icon: ImageIcon(
                                AssetImage('assets/images/dauTru.png'),
                                size: 20,
                                color: (context.read<ProductDetailsCubit>().isCountMin(state.product.count))? Colors.grey: Colors.green,
                              ),
                            ),
                          ),
                          
                          Container(
                            width: 45,
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Text(
                              '${state.product.count}',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: IconButton(
                              onPressed: cubit.increment ,
                              icon: ImageIcon(
                                AssetImage('assets/images/dauCong.png'),
                                size: 20,
                                color: cubit.isCountMax(p.count)? Colors.grey: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    
                      //Phần bên phải
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          '\$${(p.count*p.price).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      )
                    ],
                  ),
                    
                  //gạch ngang
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Divider(
                        color: Colors.grey[300], // màu xám nhẹ
                        thickness: 1,            // độ dày
                        height: 1,               // khoảng cách chiếm trên column
                        indent: 0,               // cách trái
                        endIndent: 0,            // cách phải
                    ),
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    
                        Text(
                          'Product Detail',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                    
                        IconButton(
                          onPressed: () {}, 
                          icon: ImageIcon(
                            AssetImage('assets/images/nutHuongXuong.png'),
                            size: 17,
                          )
                        ),
                    
                      ],
                    ),
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 15, 15),
                    child: Text(
                        p.detail,
                        style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                    
                  //gạch ngang
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Divider(
                        color: Colors.grey[300], // màu xám nhẹ
                        thickness: 1,            // độ dày
                        height: 1,               // khoảng cách chiếm trên column
                        indent: 0,               // cách trái
                        endIndent: 0,            // cách phải
                    ),
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    
                        Text(
                          'Nutritions',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                    
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[300]
                              ),
                              child: Text(
                                '100gr',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: const Color.fromARGB(255, 29, 29, 29),
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                            ),
                                        
                            IconButton(
                              onPressed: () {}, 
                              icon: ImageIcon(
                                AssetImage('assets/images/nutHuongPhai.png'),
                                size: 17,
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                    
                  //gạch ngang
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Divider(
                        color: Colors.grey[300], // màu xám nhẹ
                        thickness: 1,            // độ dày
                        height: 1,               // khoảng cách chiếm trên column
                        indent: 0,               // cách trái
                        endIndent: 0,            // cách phải
                    ),
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    
                        Text(
                          'Review',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                    
                        Row(
                          children: [
                            for (int i = 0; i < 5; i++) 
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Image.asset(
                                  'assets/images/saoDanhGia.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                              ),
                                        
                            IconButton(
                              onPressed: () {}, 
                              icon: ImageIcon(
                                AssetImage('assets/images/nutHuongPhai.png'),
                                size: 17,
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: SizedBox(
                    
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: () {},
                        child: const Text(
                          'Add To Basket',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void onBackButtonClick() {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();    
      }
  }

}