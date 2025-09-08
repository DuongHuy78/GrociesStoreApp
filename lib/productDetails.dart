
import 'package:flutter/material.dart';
import 'model/item.dart';

class productdetails extends StatefulWidget{
  final item product;

  const productdetails(Key? key, this.product) : super(key: key); 
  @override
  State<productdetails> createState() => _productdetails();
}

class _productdetails extends State<productdetails>{

  int _count = 1;
  var   _price ;
  String _inforPrice = '';
  final int _MAXCOUNT = 5;
  bool _isCountMin = true;
  bool _isCountMax = false;
  bool _isFav = false;

  @override
  void initState() {
    super.initState();
    _price = widget.product.price;
    _inforPrice = widget.product.infor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                  onPressed: onHeartButtonClick, 
                  icon: ImageIcon(
                    AssetImage('assets/images/traiTimChuaSang.png'),
                    color: _isFav? Colors.red:Colors.grey,
                    size: 23,
                  )
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(_inforPrice),
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
                      onPressed: onDecrementClick ,
                      icon: ImageIcon(
                        AssetImage('assets/images/dauTru.png'),
                        size: 20,
                        color: _isCountMin? Colors.grey: Colors.green,
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
                      '$_count',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: IconButton(
                      onPressed: onIncrementClick ,
                      icon: ImageIcon(
                        AssetImage('assets/images/dauCong.png'),
                        size: 20,
                        color: _isCountMax? Colors.grey: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),

              //Phần bên phải
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  '\$${(_price*_count).toStringAsFixed(2)}',
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
              'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet',
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
  }

  void decrement() {
    if(_count > 1) {
      --_count;
    }
  }

  void increment() {
    if(_count < _MAXCOUNT) {
      ++_count;
    }
  }

  void onIncrementClick() {
    setState(() {
      increment();
      if(_count >= _MAXCOUNT) {
        _isCountMax = true;
      }
      _isCountMin = false;
    });
  }

  void onDecrementClick() {
    setState(() {
      decrement();
      if(_count <= 1) {
        _isCountMin = true;
      }
      _isCountMax = false;
    });
  }

  void onBackButtonClick() {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();    
      }
  }

  void onHeartButtonClick() {
    setState(() {
      _isFav = !_isFav;
    });
  }
}