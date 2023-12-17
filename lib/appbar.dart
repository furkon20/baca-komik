import 'package:flutter/material.dart';
class appBar extends StatelessWidget {
  const appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  ),
),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              InkWell(
               
                child: Container(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('images/pp.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            'Kamu ingin baca apa?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
                padding: const EdgeInsets.only(
                  top: 8,
                  right: 10,
                  left: 10,
                  bottom: 8,
                ),
                color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Cari komik',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
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
        ],
      ),
    );
  }
}