import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfUrlSearchPage extends StatefulWidget{
  @override
  _PdfUrlSearchPageState createState() => _PdfUrlSearchPageState();
}

class _PdfUrlSearchPageState extends State<PdfUrlSearchPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  PdfTextSearchResult _searchResult = PdfTextSearchResult();
  final TextEditingController _searchController = TextEditingController();

  // 📁 لینک فایل PDF آنلاین
  final String pdfUrl =
      'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf';

  void _startSearch() {
    final keyword = _searchController.text.trim();
    if (keyword.isNotEmpty) {
      // _searchResult = _pdfViewerKey.currentState!.searchText(keyword);
      setState(() {});
    }
  }

  Widget _buildSearchBar() {   
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'جستجوی عبارت...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                isDense: true,
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _searchResult.clear();
                    setState(() {});
                  },
                ),
              ),
              onSubmitted: (_) => _startSearch(),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _startSearch,
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar() {
    if (_searchResult.totalInstanceCount == 0) return SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          Text(
            'نتیجه ${_searchResult.currentInstanceIndex + 1} از ${_searchResult.totalInstanceCount}',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          // IconButton(
          //   icon: Icon(Icons.navigate_before),
          //   onPressed: _searchResult.hasPreviousInstance
          //       ? () => _searchResult.previousInstance()
          //       : null,
          // ),
          // IconButton(
          //   icon: Icon(Icons.navigate_next),
          //   onPressed: _searchResult.hasNextInstance
          //       ? () => _searchResult.nextInstance()
          //       : null,
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نمایش PDF با جستجو'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildNavigationBar(),
          Expanded(
            child: SfPdfViewer.network(
              pdfUrl,
              key: _pdfViewerKey,
            ),
          ),
        ],
      ),
    );
  }
}