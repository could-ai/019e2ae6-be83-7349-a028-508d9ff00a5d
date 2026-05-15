import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const GlassStudyApp());
}

class GlassStudyApp extends StatelessWidget {
  const GlassStudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ME Glass Manufacturing Study',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0077B6),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00B4D8),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Glass Manufacturing Study'),
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: const Text(
                  'Glass manufacturing is an important industry in the Middle East because of strong demand from construction, food packaging, beverages, cosmetics, and pharmaceuticals. The Gulf region and Egypt have several major companies producing glass containers, flat glass, and industrial glass products.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                _buildStudyContent(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStudyContent() {
    return [
      _buildCountrySection('Egypt', [
        const CompanyCard(
          name: 'Sphinx Glass',
          description:
              'One of the largest glass manufacturers in Egypt and the Middle East. Founded in 2008, the company exports products to Europe, Africa, and the Middle East.',
          products: ['Float glass', 'Architectural glass', 'Automotive glass'],
        ),
        const CompanyCard(
          name: 'Middle East Glass Manufacturing (MEG)',
          description:
              'A leading producer of glass containers in Egypt. The company supplies Coca-Cola and other major beverage companies.',
          products: [
            'Beverage bottles',
            'Food jars',
            'Pharmaceutical glass containers'
          ],
        ),
        const CompanyCard(
          name: 'Saint-Gobain Egypt',
          description:
              'Manufactures flat glass and construction glass products for buildings and infrastructure projects.',
          products: [],
        ),
      ]),
      _buildCountrySection('Saudi Arabia (KSA)', [
        const CompanyCard(
          name: 'Saudi Arabian Glass Company (SAGC)',
          description:
              'One of the largest glass container manufacturers in the Gulf region. Supplies local and international food and beverage brands.',
          products: [
            'Soft drink bottles',
            'Juice bottles',
            'Food jars',
            'Glass packaging'
          ],
        ),
        const CompanyCard(
          name: 'Zoujaj Glass',
          description: 'Serves the construction and industrial sectors.',
          products: [
            'Float glass',
            'Coated glass',
            'Energy-efficient architectural glass'
          ],
        ),
      ]),
      _buildCountrySection('Kuwait', [
        const CompanyCard(
          name: 'Kuwait Glass Manufacturing Company',
          description:
              'Supports food, beverage, and pharmaceutical industries in Kuwait and neighboring countries.',
          products: [
            'Glass bottles',
            'Glass containers',
            'Industrial glass products'
          ],
        ),
      ]),
      _buildCountrySection('United Arab Emirates (UAE)', [
        const CompanyCard(
          name: 'Emirates Glass',
          description:
              'One of the leading architectural glass companies in the UAE. The company has supplied many famous skyscrapers in Dubai and Abu Dhabi.',
          products: [
            'High-performance coated glass',
            'Energy-saving glass',
            'Tempered glass',
            'Laminated glass'
          ],
        ),
        const CompanyCard(
          name: 'Gulf Glass Industries',
          description: 'Exports to GCC and African markets.',
          products: [
            'Beverage bottles',
            'Food jars',
            'Cosmetic glass containers',
            'Pharmaceutical packaging'
          ],
        ),
      ]),
      _buildCountrySection('Qatar', [
        const CompanyCard(
          name: 'Qatar National Glass Factory',
          description:
              'Supports Qatar’s construction and infrastructure sectors.',
          products: [
            'Float glass',
            'Tempered glass',
            'Architectural glass',
            'Decorative glass products'
          ],
        ),
      ]),
      _buildConclusionSection(),
    ];
  }

  Widget _buildCountrySection(String country, List<Widget> companies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          country,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0077B6),
          ),
        ),
        const Divider(),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: companies.map((c) => SizedBox(width: (constraints.maxWidth / 2) - 8, child: c)).toList(),
              );
            }
            return Column(
              children: companies.map((c) => Padding(padding: const EdgeInsets.only(bottom: 16), child: c)).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildConclusionSection() {
    return Container(
      margin: const EdgeInsets.only(top: 48, bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0077B6).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF0077B6).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Conclusion',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0077B6),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'The glass industry in Egypt and the Gulf countries is growing rapidly because of construction projects, food and beverage industries, pharmaceutical packaging demand, and infrastructure development.\n\n'
            'Main products manufactured include:\n'
            '• Glass bottles and jars\n'
            '• Float and architectural glass\n'
            '• Tempered and laminated glass\n'
            '• Industrial and pharmaceutical glass\n\n'
            'Egypt and Saudi Arabia are among the largest producers in the region, while the UAE and Qatar focus strongly on advanced architectural glass technologies.',
            style: TextStyle(fontSize: 16, height: 1.6),
          ),
        ],
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  final String name;
  final String description;
  final List<String> products;

  const CompanyCard({
    super.key,
    required this.name,
    required this.description,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: theme.colorScheme.primary,
              width: 4,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
              if (products.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text(
                  'Products:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: products.map((product) {
                    return Chip(
                      label: Text(
                        product,
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      side: BorderSide.none,
                      padding: EdgeInsets.zero,
                    );
                  }).toList(),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
