
import 'package:flutter/material.dart';

class EarlyBlightView extends StatelessWidget {
  const EarlyBlightView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Early Blight Disease'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all( 15.0),
        child: SingleChildScrollView(
          child: Column(

              children: [
                Image(image: NetworkImage('https://www.planetnatural.com/wp-content/uploads/2012/12/potato-blight.jpg'),),
// const Image(image:const  AssetImage('assets/images/late.jpg'),width: 300,height: 300,),
                const SizedBox(height: 5,),
                const    Text('Early Blight ',style: TextStyle(color: Colors.brown,fontSize: 30,fontWeight: FontWeight.bold),),
                const   SizedBox(height: 30,),
                const  Text('Treatment :',style: TextStyle(color: Colors.brown,fontSize: 25,fontWeight: FontWeight.bold),),
                const   SizedBox(height: 10,),
                const Text(

                  ' 1. Prune or stake plants to improve air circulation and reduce fungal'
                      ' problems.'
                      '2. Make sure to disinfect your pruning shears (one part bleach to 4 parts'
                      '  water) after each cut.'
                      ' 3. Keep the soil under plants clean and free of garden debris. Add a layer'
                      'of organic compost to prevent the spores from splashing back up onto'
                      ' vegetation.'
                      ' 4. Drip irrigation and soaker hoses can be used to help keep the foliage'
                      ' dry.'
                      '  5. For best control, apply copper-based fungicides early, two weeks'
                      'before disease normally appears or when weather forecasts predict a'
                      ' long period of wet weather. Alternatively, begin treatment when'
                      ' disease first appears, and repeat every 7-10 days for as long as needed.'
                      '   6. Containing copper and pyrethrins, Bonide® Garden Dust is a safe, one-'
                      ' step control for many insect attacks and fungal problems. For best'
                      ' results, cover both the tops and undersides of leaves with a thin'
                      ' uniform film or dust. Depending on foliage density, 10 oz will cover'
                      ' 625 sq ft. Repeat applications every 7-10 days, as needed.'
                      '     7. SERENADE Garden is a broad spectrum, preventative bio-fungicide'
                      'recommended for the control or suppression of many important plant'
                      '  diseases. For best results, treat prior to foliar disease development or'
                      'at the first sign of infection. Repeat at 7-day intervals or as needed.'
                      '  8. Remove and destroy all garden debris after harvest and practice crop'
                      ' rotation the following year.'
                      '   9. Burn or bag infected plant parts. Do NOT compost.'  ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),              ]
          ),
        ),
      ),
    );
  }
}
