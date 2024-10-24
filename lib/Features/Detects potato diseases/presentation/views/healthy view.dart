import 'package:flutter/material.dart';

class Healthy extends StatelessWidget {
  const Healthy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Late Blight Disease'),
        backgroundColor: Colors.brown,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const Image(
              image: NetworkImage(
                  'https://img.freepik.com/premium-photo/fresh-green-leaf-potato-plant-isolated_696657-22650.jpg'),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Healthy Potato ',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Importance of potato',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'The importance of healthy potatoes lies in their nutritional value and their role in a balanced diet. Here are some key points highlighting the importance of healthy potatoes:'
                  '1.Nutrient-Rich: Potatoes are a good source of several essential nutrients, including potassium, vitamin C, vitamin B6, and dietary fiber. These nutrients are important for overall health, supporting functions such as heart health, digestion, and immune function.'
                  '2.Energy Source: Potatoes are rich in carbohydrates, which are the body`s primary source of energy. Consuming potatoes can provide a quick and sustainable energy boost, making them an ideal food choice for active individuals and athletes.'
                  '3.Dietary Fiber: Potatoes contain both soluble and insoluble fiber, which promote digestive health by regulating bowel movements, preventing constipation, and supporting a healthy gut microbiota. Fiber also helps control blood sugar levels and may reduce the risk of chronic diseases like heart disease and diabetes.'
                  '4.Antioxidants: Potatoes contain various antioxidants, such as flavonoids, carotenoids, and phenolic acids, which help protect cells from damage caused by free radicals. Antioxidants play a crucial role in reducing inflammation, preventing chronic diseases, and supporting overall health and well-being.'
                  '5.Versatility: Potatoes are a versatile ingredient that can be prepared and enjoyed in numerous ways, including boiled, baked, mashed, roasted, or steamed. They can be incorporated into various dishes, from salads and soups to main courses and snacks, making them a convenient and adaptable food option.'
                  '6.Affordability: Potatoes are a cost-effective food choice that provides significant nutritional value at a relatively low cost. They are widely available year-round and can be purchased fresh, frozen, or canned, making them accessible to people with different budgets and dietary preferences.'
                  '7.Satiety: Potatoes have a high satiety index, meaning they can help keep you feeling full and satisfied after a meal. This can aid in portion control and weight management by reducing overall calorie intake and preventing overeating.'
                  'Overall, incorporating healthy potatoes into your diet can contribute to overall health, providing essential nutrients, energy, and culinary versatility. However, it is essential to consume them as part of a balanced diet that includes a variety of fruits, vegetables, whole grains, lean proteins, and healthy fats.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
