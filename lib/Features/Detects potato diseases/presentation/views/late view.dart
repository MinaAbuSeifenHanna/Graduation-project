import 'package:flutter/material.dart';

class LateBlight extends StatelessWidget {
  const LateBlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Late Blight Disease'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const Image(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmxM2tj9-3Vprk-_-vBmh6dew8IWAc6tb3bwv52ibY_-iS-UjX3jYmScHpJzhKX9-E4ZEJy_aeAZnG92DCF0R2O5VsxTV3sQQzxl7Z0w'),
            ),
// const Image(image:const  AssetImage('assets/images/late.jpg'),width: 300,height: 300,),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Late Blight ',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Treatment :',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '  1. Plant resistant cultivars when available.'
                  ' 2. Remove volunteers from the garden prior to planting and space plants'
                  ' far enough apart to allow for plenty of air circulation.'
                  '3. Water in the early morning hours, or use soaker hoses, to give plants'
                  'time to dry out during the day — avoid overhead irrigation.'
                  '4. Destroy all tomato and potato debris after harvest (see Fall Garden'
                  'Cleanup).'
                  'If symptoms are observed, treat plants with one of the following fungicides:'
                  ' • Apply a copper based fungicide (2 oz/ gallon of water) every 7 days or'
                  ' less, following heavy rain or when the amount of disease is increasing'
                  'rapidly. If possible, time applications so that at least 12 hours of dry'
                  'weather follows application.'
                  '• Used as a foliar spray, Organocide® Plant Doctor will work its way'
                  'through the entire plant to prevent fungal problems from occurring'
                  ' and attack existing many problems. Mix 2 tsp/ gallon of water and'
                  'spray at transplant or when direct seeded crops are at 2-4 true leaf,'
                  ' at 1-2 week intervals as required to control disease.'
                  '• Safely treat fungal problems with SERENADE Garden. This broad'
                  'spectrum bio-fungicide uses a patented strain of Bacillus subtilis and is'
                  'approved for organic use. Best of all, SERENADE is completely non-'
                  'toxic to honey bees and beneficial insects.'
                  'Monterey® All Natural Disease Control is a ready-to-use blend of'
                  'naturally occurring ingredients that control most plant foliar diseases.'
                  'All stages of the disease is controlled, but applying before infestation'
                  'gives the best results.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
