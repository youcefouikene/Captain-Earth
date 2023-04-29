import 'package:flutter/material.dart';
import 'package:projet_2cp/Screens/Profil/Profil.dart';

class tryi extends StatelessWidget {
  const tryi({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('Oceanie'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/WelcomeStation', arguments: {
                    'numStation': '0',
                    'pathJeu': '/OceanieMiniJeu',
                    'pathQuiz': '/OceanieMiniJeu',
                  });
                },
              ),
              ElevatedButton(
                child: Text('Asie'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/WelcomeStation', arguments: {
                    'numStation': '1',
                    'pathJeu': '/AsieMiniJeu',
                    'pathQuiz': '/AsieMiniJeu',
                  });
                },
              ),
              ElevatedButton(
                child: Text('Afrique'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/WelcomeStation', arguments: {
                    'numStation': '2',
                    'pathJeu': '/AfriqueMiniJeu',
                    'pathQuiz': '/AfriqueMiniJeu',
                  });
                },
              ),
              ElevatedButton(
                child: Text('Europe'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/WelcomeStation', arguments: {
                    'numStation': '3',
                    'pathJeu': '/EuropeMiniJeu',
                    'pathQuiz': '/EuropeMiniJeu',
                  });
                },
              ),
              ElevatedButton(
                child: Text('Amerique North'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/WelcomeStation', arguments: {
                    'numStation': '4',
                    'pathJeu': '/AmeriqueNordMiniJeu',
                    'pathQuiz': '/AmeriqueNordMiniJeu',
                  });
                },
              ),
              ElevatedButton(
                child: Text('Amerique South'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/WelcomeStation', arguments: {
                    'numStation': '5',
                    'pathJeu': '/AmeriqueSudMiniJeu',
                    'pathQuiz': '/AmeriqueSudMiniJeu',
                  });
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('Profil'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profil(
                              username: 'username', pathPhoto: 'pathPhoto')));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
