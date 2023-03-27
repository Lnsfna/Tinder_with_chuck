import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.primary);

    return Scaffold(
        body: Column(children: [
      Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 3.0, color: theme.colorScheme.primary),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_fire_department_outlined,
              size: 50,
              color: style.color,
            ),
            Text(
              "Tinder with Chuck",
              style: style,
            ),
          ],
        ),
      ),
      Expanded(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.star_border, color: style.color),
              title: Text.rich(TextSpan(
                  style: TextStyle(color: theme.colorScheme.secondary),
                  children: const [
                    TextSpan(
                        text: 'Author:  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    TextSpan(
                        text: 'Safina Alina', style: TextStyle(fontSize: 20))
                  ])),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border,
                color: style.color,
              ),
              title: Text.rich(TextSpan(
                  style: TextStyle(color: theme.colorScheme.secondary),
                  children: const [
                    TextSpan(
                        text: 'Repository:  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    TextSpan(
                        text: 'https://github.com/Lnsfna/Tinder_with_chuck',
                        style: TextStyle(fontSize: 20))
                  ])),
            ),
          ],
        ),
      )
    ]));
  }
}
