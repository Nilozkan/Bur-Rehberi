import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi=Colors.pink; //appbar rengini varsayılan olarak burada tanımladık
  late PaletteGenerator _generator;

  @override //initState bir kere çalışır değişkenlerin ilk atamalarını yapmakda kullanılır
  void initState() {
    super.initState();
    appbarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
     body: CustomScrollView(
      slivers: [      //slivers bzden içinde widgetlar olan bir liste bekler
      SliverAppBar( //kendine ait ayrı appbarı var
        expandedHeight:250 , //uygulama açıldığında ne kadarlık yer tutsun
        pinned: true, //yukarı aşağı kaydırdığında sabit dursun
        backgroundColor: appbarRengi, //buraya varsayılanı atadık appbar rengi resme göre değiştiğinde burada hep pembe çıkmasın yeni renk set edilsin diye yaptık
        flexibleSpace: FlexibleSpaceBar(
          title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
          centerTitle: true,
          background: Image.asset(
            'images/'+ widget.secilenBurc.burcBuyukResim,  //büyük resim sayfaya eklendi
             fit: BoxFit.cover, //resim sayfaya sığdırıldı
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.all(16), //yazıları kenardan uzaklaştırdı
          padding: EdgeInsets.all(8), //içeriden boşluk verir
          child: SingleChildScrollView(
            child: Text(
              widget.secilenBurc.burcDetayi,//burcun detay bilgilerini classtan çekti
              style: Theme.of(context).textTheme.subtitle1, //Yazıları belirginleştirdi
              ),
          ),
        ),
      )

      ],

      ),
     
    );
  }
  
  void appbarRenginiBul() async{
    _generator= await PaletteGenerator.fromImageProvider(
      AssetImage('images/${widget.secilenBurc.burcBuyukResim}') );
      appbarRengi=_generator.vibrantColor!.color;
      setState(() {
        
      });
  }
}