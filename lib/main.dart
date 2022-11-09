import 'package:buscador_flutter/model/movie_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

//2. Creamos el buscador
class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //2. Luego de crear el model creamos la lista
  static List<MovieModel> main_movies_list = [
    MovieModel("Volver al futuro", 1994, 10.0),
    MovieModel("Terminantor", 1913, 6.0),
    MovieModel("Avengers: Infinity war", 2019, 10.0),
    MovieModel("Black Adam", 2022, 8.0),
    MovieModel("Peacemeaker", 2021, 10.0),
    MovieModel("She Hulk", 2022, 5.0),
    MovieModel("Iron Man", 2007, 5.0),
    MovieModel("Batman", 1990, 5.0),
    MovieModel("Joker", 2019, 10.0),
  ];

  //Lista en donde vamos buscar y filtrar
  List<MovieModel> display_list = List.from(main_movies_list);
//Creamos una función donde contendrá el contenido de la lista de las categorías
  void updateList(String value) {
    setState(() {
      display_list = main_movies_list
          .where((element) =>
              element.movite_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0.0,
        title: Text('AppPrueba'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido al buscador de prueba',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: ((value) => updateList(value)),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Buscar contenido .... ',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Aqui pondremos la lógica para llamar a la lista
            Expanded(
              //función en caso no haya lo encontrado
              child: display_list.length == 0
                  ? Center(
                      child: Text(
                        'Resultado no encontrado',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                            contentPadding: EdgeInsets.all(8.0),
                            title: Text(
                              display_list[index].movite_title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${display_list[index].movie_release_year!}',
                              style: TextStyle(color: Colors.white60),
                            ),
                            trailing: Text(
                              '${display_list[index].rating!}',
                              style: TextStyle(color: Colors.amber),
                            ),
                          )),
            ),
          ],
        ),
      ),
    );
  }
}
