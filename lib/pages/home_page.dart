import 'package:flutter/material.dart';
import 'package:flutter_animations/pages/data/http/http_client.dart';
import 'package:flutter_animations/pages/data/repositories/product_repository.dart';
import 'package:flutter_animations/pages/stores/product_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductStore store = ProductStore(
    repository: ProductRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'API calls',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: AnimatedBuilder(
          animation: Listenable.merge([
            store.isLoading,
            store.error,
            store.state,
          ]),
          builder: (context, child) {
            if (store.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (store.error.value.isNotEmpty) {
              return Center(
                child: Text(store.error.value),
              );
            }

            if (store.state.value.isEmpty) {
              return const Center(
                child: Text('No data'),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 32,
                ),
                padding: const EdgeInsets.all(16),
                itemCount: store.state.value.length,
                itemBuilder: (_, index) {
                  final item = store.state.value[index];
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          item.thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}
