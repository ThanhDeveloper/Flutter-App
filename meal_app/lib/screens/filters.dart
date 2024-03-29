import 'package:flutter/material.dart';

enum Filter{
  glutenFree,
  lactoseFree
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFilterFreeSet = false;
  var _lactoseFilterFreeSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filter'),
      ),
      body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if(didPop) return;
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFilterFreeSet,
              Filter.lactoseFree: _lactoseFilterFreeSet,
            });
          },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFilterFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFilterFreeSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: _lactoseFilterFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFilterFreeSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
            )
          ],
        ),
      ),
    );
  }
}
