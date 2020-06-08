import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portugameapp/estilo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      ));

    return MaterialApp(
      title: 'Portugame',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.firaSansTextTheme(
          Theme.of(context).textTheme,),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFEFEFE),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15), // Espaçamento da largura total
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _cabecalho(), //chama cabeçalho App Letras (ir p linha 229)
              ],
            ),
            SizedBox(height: 10),
            _introCard(),
            _title('Menu'), // Texto abaixo do box grande cinza
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _menuItem('Origem do\n Idioma', FontAwesomeIcons.buffer,
                    blueGradient), // primeiro box peq
                _menuItem('Países que \n falam', FontAwesomeIcons.globe,
                    blueGradient),// segundo box peq
                _menuItem('Novo Acordo\n PDF', FontAwesomeIcons.file,
                    blueGradient),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _menuItem('Principais\n Alterações', FontAwesomeIcons.exchangeAlt, blueGradient),
                _menuItem('QUIZ', FontAwesomeIcons.question, yellowGradient),
                _menuItem(
                    'Entre em\n contato', FontAwesomeIcons.at, blueGradient),
              ],
            ),
          ],
        ),
      ),
    );
  }



  _menuItem(String title, IconData iconData, LinearGradient gradient) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.35, // ***altura do quadrinho
      width: MediaQuery.of(context).size.width * 0.25,// ***largura
      margin: EdgeInsets.all(4), // ***espaçamento entre quadrinhos
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),



      child: Column( // ***formatação quadrinhos
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            child: Center( // ***tamanho das bolinhas
              child: Icon(iconData, size: 24, color: Colors.white),
            ),
            decoration: BoxDecoration(
              gradient: gradient,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 7),
          Text(
            title,
            style: TextStyle(
              fontSize: 14, // ***formatação letra quadrinhos
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }


  _title(String title) {// ***formatação texto MENU
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.blueGrey[900],
      ),
    );
  }


  _introCard() { // ***formatação box grande cinza escuro
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      height: 120,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), // ***figura cinza escuro
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.20), // ***cor da sombra do box
              offset: Offset(0, 3),
              spreadRadius: 4,
              blurRadius: 5,
            )
          ]),


      child: Column( // ***gera texto dentro do box cinza
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'PortuGame', // ***texto dentro do box grande***
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 1),
          Text(
            'Pratique as alterações do Novo Acordo Ortográfico .',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }


  _cabecalho() { // ***gera o título: App Letras  (ir p linha 54)
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'App Letras', // ***TÍTULO: App Letras***
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 15,
            fontWeight: FontWeight.w100,
          ),
        ),
        SizedBox(height: 5),

      ],
    );
  }
}