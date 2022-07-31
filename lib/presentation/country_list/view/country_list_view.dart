import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';
import 'package:cubit_clean_architecture/presentation/component/component.dart';
import 'package:cubit_clean_architecture/presentation/country_list/country_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryListView extends StatelessWidget {
  const CountryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CountryListCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('country_list').tr(),
      ),
      body: BlocConsumer<CountryListCubit, CountryListState>(
        listener: (context, state) {
          if (state is CountryListError) {
            bloc.showErrorSnackBar(
              SnackBar(
                content: Text(
                  state.errorText,
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
          if (state is CountryListLoading) {
            return const _Loading();
          } else if (state is CountryListSuccess) {
            return _CountryList(
              countries: state.countries,
              onCardTap: bloc.openCard,
            );
          }

          return Container();
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
    required this.onCardTap,
  }) : super(key: key);

  final Iterable<Country>? countries;
  final Function(Country) onCardTap;

  @override
  Widget build(BuildContext context) {
    final countries = this.countries;

    if (countries == null || countries.isEmpty) {
      return const _EmptyList();
    }

    return ListView.separated(
      itemBuilder: (_, index) {
        final country = countries.elementAt(index);

        return CountryCard(
          flag: country.flag,
          name: country.name,
          onTap: () => onCardTap(country),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemCount: countries.length,
      cacheExtent: 800,
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
