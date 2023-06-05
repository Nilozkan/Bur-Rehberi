import 'package:burc_rehberi/model/burc_detay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BurcItem extends StatelessWidget {
  final listelenenBurc;
  const BurcItem({required this.listelenenBurc});

  @override
  Widget build(BuildContext context) {
    var myTextStle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BurcDetay(secilenBurc: listelenenBurc),
                   ),
              );
            },
            leading: Image.asset("images/"+listelenenBurc.burcKucukResim,
            ),
            title: Text(
              listelenenBurc.burcAdi,
              style: myTextStle.headline5,
              ),
            subtitle: Text(
              listelenenBurc.burcTarihi, 
              style: myTextStle.subtitle1,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}