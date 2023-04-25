import 'package:flutter/material.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "museum", // in logical pixels
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 255, 255, 255)),
      home: const Artwork(),
    );
  }
}

class Artwork extends StatefulWidget {
  const Artwork({super.key});

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;
  var messageMonaLisa =
      "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.";

  void _changeColor() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _displayDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Museum'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/Mona_Lisa.jpg',
                ),
                Icon(
                  Icons.favorite,
                  color: (!_isFavorite
                      ? const Color.fromARGB(180, 223, 213, 209)
                      : const Color.fromARGB(255, 249, 45, 45)),
                  size: 100.0,
                ),
                Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 350,
                    child: SingleChildScrollView(
                        child: Text((_showDescription ? messageMonaLisa : ""),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18))))
              ],
            ),
            const Text("Mona Lisa",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Merriweather',
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                )),
            const Text(
              "Léonard de Vinci",
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Merriweather',
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  color: (!_isFavorite
                      ? Colors.brown
                      : const Color.fromARGB(255, 249, 45, 45)),
                  onPressed: () {
                    _changeColor();
                    (_isFavorite
                        ? (ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Oeuvre ajoutée à vos favoris'),
                                duration: Duration(seconds: 1))))
                        : false);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.article),
                  color: Colors.brown,
                  onPressed: () {
                    _displayDescription();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> main() async => runApp(
      const MuseumApp(),
    );
