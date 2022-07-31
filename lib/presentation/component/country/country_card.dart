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
              Radius.circular(8),
            ),
          ),
          child: Stack(
            children: [
              _FlagImage(flag: flag),
              Positioned(
                bottom: 10,
                right: 10,
                left: 10,
                child: _NameLabel(name: name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlagImage extends StatelessWidget {
  const _FlagImage({
    Key? key,
    required this.flag,
  }) : super(key: key);

  final String flag;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
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
    );
  }
}

class _NameLabel extends StatelessWidget {
  const _NameLabel({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              constraints: constraints.copyWith(minWidth: 0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: Colors.white70,
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}
