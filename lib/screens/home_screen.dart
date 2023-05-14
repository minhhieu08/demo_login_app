import 'package:agribank_app/widgets/branch_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _activePage = const BranchList();
    switch (_selectedPageIndex) {
      case 0:
        _activePage = const BranchList();
        break;
      case 1:
        _activePage = const Placeholder();
        break;
      default:
        throw UnimplementedError("Screen not found");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      body: _activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang Chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài đặt',
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
