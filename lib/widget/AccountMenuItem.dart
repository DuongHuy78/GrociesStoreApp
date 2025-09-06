import 'package:flutter/material.dart';

class AccountMenuItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

    const AccountMenuItem({
    Key? key,
    required this.title,
    required this.iconPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 12, 10, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(this.iconPath, width: 18,),
            SizedBox(width: 15,),
            //ở đây sử dụng expanded vì:
            // khi sử dụng thì text sẽ chiếm lấy toàn bộ không gian
            // nên icon ở cuối sẽ nằm sát ở cuối cùng
            Expanded(
              child: Text(
                this.title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),

            Image.asset('assets/images/nutHuongPhai.png', width: 9)
          ],
        ),
      ),
    );
  }
}