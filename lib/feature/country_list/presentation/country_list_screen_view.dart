import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country.dart';
import 'package:cubit_clean_architecture/feature/country_list/presentation/country_list_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryListScreenView extends StatelessWidget {
  const CountryListScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CountryListScreenCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Список стран'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.refresh,
        child: const Icon(Icons.refresh),
      ),
      body: BlocConsumer<CountryListScreenCubit, CountryListScreenState>(
        listener: (context, state) {
          if (state.status == CountryListScreenStatus.error) {
            bloc.showErrorSnackBar(
              SnackBar(
                content: Text(
                  state.errorText ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            );
          }
        },
        builder: (_, state) {
          if (state.status == CountryListScreenStatus.loading) {
            return const _Loading();
          }

          return _CountryList(
            countries: state.countries,
            nameStyle: const TextStyle(fontSize: 14),
          );
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _CountryList extends StatelessWidget {
  const _CountryList({
    Key? key,
    required this.countries,
    required this.nameStyle,
  }) : super(key: key);

  final Iterable<Country>? countries;
  final TextStyle nameStyle;

  @override
  Widget build(BuildContext context) {
    final countries = this.countries;

    if (countries == null || countries.isEmpty) {
      return const _EmptyList();
    }

    return ListView.separated(
      itemBuilder: (_, index) => _CountryWidget(
        data: countries.elementAt(index),
        countryNameStyle: nameStyle,
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemCount: countries.length,
      cacheExtent: 800,
    );
  }
}

class _CountryWidget extends StatelessWidget {
  const _CountryWidget({
    Key? key,
    required this.data,
    required this.countryNameStyle,
  }) : super(key: key);

  final Country data;
  final TextStyle countryNameStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                data.flag,
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
                        data.name,
                        style: countryNameStyle,
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
    );
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Список пуст'),
    );
  }
}
