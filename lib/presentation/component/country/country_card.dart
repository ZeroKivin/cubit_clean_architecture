import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key? key,
    required this.flag,
    required this.name,
    this.onTap,
  }) : super(key: key);

  final String flag;
  final String name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: name,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                child: Container(
                  transform: Matrix4.rotationZ(-0.2)
                    ..scale(1.2)
                    ..translate(-50.0),
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    flag,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                left: 10,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        const Spacer(),
                        Container(
                          constraints: constraints.copyWith(minWidth: 0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: Colors.white70,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
