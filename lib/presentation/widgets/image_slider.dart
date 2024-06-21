import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  ScrollController? _scrollController;
  int _currentPage = 0;
  double _imageWidth = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _scrollToPage();
    }
  }

  void _nextPage() {
    if (_currentPage < 1) {
      _currentPage++;
      _scrollToPage();
    }
  }

  void _scrollToPage() {
    _scrollController!.animateTo(
      _currentPage * _imageWidth,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _imageWidth = MediaQuery.of(context).size.width * 0.9; // Adjusted width
    double imageHeight;

    if (kIsWeb || MediaQuery.of(context).size.width > 600) {
      imageHeight = MediaQuery.of(context).size.height * 0.5;
    } else {
      imageHeight = MediaQuery.of(context).size.height * 0.3;
    } // Adjusted height

    return Container(
      width: double.infinity,
      height: imageHeight , // Adjust total height as needed to fit buttons
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the left
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                // Image 1
                Container(
                  width: _imageWidth,
                  height: imageHeight,
                  margin: EdgeInsets.symmetric(horizontal: 2.0), // Adjust spacing
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                        'assets/images/img_4.png',
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                // Image 2
                Container(
                  width: _imageWidth,
                  height: imageHeight,
                  margin: EdgeInsets.symmetric(horizontal: 2.0), // Adjust spacing
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/img_5.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8), // Adjust spacing between ListView and Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: ImageIcon(
                  AssetImage('assets/images/img_6.png'),
                  color: _currentPage == 0 ? Color(0xFF292929) : Color(0xFFB8B8B8),
                ),
                onPressed: _previousPage,
              ),
              IconButton(
                icon: ImageIcon(
                  AssetImage('assets/images/img_7.png'),
                  color: _currentPage == 1 ? Color(0xFF292929) : Color(0xFFB8B8B8),
                ),
                onPressed: _nextPage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
