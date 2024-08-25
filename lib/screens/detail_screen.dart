import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: id,
                child: Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(5, 5),
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ], borderRadius: BorderRadius.circular(15)),
                    child: Image.network(thumb)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
