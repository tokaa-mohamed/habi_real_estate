import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class Property360Screen extends StatefulWidget {
  final String propertyTitle;
  
  final String frontImageUrl;
  final String backImageUrl;
  final String sideImageUrl;
  
  final String livingRoomImageUrl;
  final String kitchenImageUrl;
  final String bedroomImageUrl;
  final String bathroomImageUrl;

  const Property360Screen({
    super.key,
    required this.propertyTitle,
    required this.frontImageUrl,
    required this.backImageUrl,
    required this.sideImageUrl,
    required this.livingRoomImageUrl,
    required this.kitchenImageUrl,
    required this.bedroomImageUrl,
    required this.bathroomImageUrl,
  });

  @override
  State<Property360Screen> createState() => _Property360ViewScreenState();
}

class _Property360ViewScreenState extends State<Property360Screen> {
  late String currentImageUrl;
  String selectedFilter = 'Outdoor'; 
    String selectedSubTab = 'Front';   
    
  @override
  void initState() {
    super.initState();
    currentImageUrl = widget.frontImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 4.0,
              child: Center(
                child: Image.network(
                  currentImageUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.broken_image, color: Colors.white, size: 50),
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Property View",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 16),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: selectedFilter == 'Outdoor'
                          ? [
                              _buildTabButton('Front', widget.frontImageUrl),
                              const SizedBox(width: 8),
                              _buildTabButton('Back', widget.backImageUrl),
                              const SizedBox(width: 8),
                              _buildTabButton('Side', widget.sideImageUrl),
                            ]
                          : [
                              _buildTabButton('Living Room', widget.livingRoomImageUrl),
                              const SizedBox(width: 8),
                              _buildTabButton('Kitchen', widget.kitchenImageUrl),
                              const SizedBox(width: 8),
                              _buildTabButton('Bedroom', widget.bedroomImageUrl),
                              const SizedBox(width: 8),
                              _buildTabButton('Bathroom', widget.bathroomImageUrl),
                            ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedFilter == 'Outdoor' ? Colors.teal : Colors.white.withOpacity(0.8),
                      foregroundColor: selectedFilter == 'Outdoor' ? Colors.white : Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedFilter = 'Outdoor';
                        selectedSubTab = 'Front';
                        currentImageUrl = widget.frontImageUrl; 
                                              });
                    },
                    child: const Text("Outdoor", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedFilter == 'Indoor' ? Colors.teal : Colors.white.withOpacity(0.8),
                      foregroundColor: selectedFilter == 'Indoor' ? Colors.white : Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedFilter = 'Indoor';
                        selectedSubTab = 'Living Room';
                        currentImageUrl = widget.livingRoomImageUrl; 
                                              });
                    },
                    child: const Text("Indoor", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, String imageUrl) {
bool isSelected = selectedSubTab == title;
    return GestureDetector(
      onTap: () {
        print("====== CHANGING IMAGE TO: $imageUrl ======"); 
                setState(() {
          selectedSubTab = title;
          currentImageUrl = imageUrl;
        });
      },      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.tealAccent.shade700 : Colors.grey.withOpacity(0.6),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}