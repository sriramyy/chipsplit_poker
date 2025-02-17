// SRIRAM YERRAMSETTY
// CHIPSPLIT
// 2023
// RELIABILITY IS NOT GUARENTEED
// HAS NOT BEEN RAN IN A WHILE
// & PHOTOS DO NOT SHOW PROPERLY
  

import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:math';
// import 'dart:developer';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/playerStartPage' : (context) => const PlayerSelectPage(),
        '/settings': (context) => const SettingsPage(),
        '/instructions': (context) => const InstructionsPage(),
        '/about': (context) => const AboutPage(),
      },
      initialRoute: '/',
    );
  }
}

int chipAmount = 40;
int dollarAmount = 20;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              '', // lost image
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/playerStartPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF3131),
              ),
              child: const Text('Start Game'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFF3131),
              ),
              child: const Text('Settings'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/instructions');
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFF3131),
              ),
              child: const Text('Instructions'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFF3131),
              ),
              child: const Text('About'),
            ),
            const SizedBox(height: 10),
            
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  void saveSettings() {
    print('Chip Amount: $chipAmount');
    print('Dollar Amount: $dollarAmount');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFFFF3131),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                chipAmount = value as int;
              },
              decoration: const InputDecoration(
                labelText: 'Chip Amount (Default: 20)',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                dollarAmount = value as int;
              },
              decoration: const InputDecoration(
                labelText: 'Dollar Amount (Default: 20)',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveSettings();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF3131),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructions'),
        backgroundColor: const Color(0xFFFF3131),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              '', // lost image
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Instructions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'When Player A owes Player B money, fill in the form, filling out who owes who money and how much money they owe.\n\n'
              'At the end of the game, ChipSplit will automatically compute the least amount of transactions to allow for a more efficient way to transfer money and allow you and your friends to get back to playing faster.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: const Color(0xFFFF3131),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              '', // lost image
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'About',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We've all been there.\n"
              "It's the end of a Poker game; everyone's shuffling money, but no one is keeping track. People are missing money, some people have too much...\n"
              "It's all a headache.\n\n"
              "With ChipSplit, you skip the headache. ChipSplit automatically computes the most efficient way for everyone to transfer their money with the least transactions.\n\n"
              "The result?\n"
              "The time that would've been spent painstakingly counting and shuffling money now can be actually playing.\n\n"
              "Skip the headache, ChipSplit.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class PlayerSelectPage extends StatefulWidget {
  const PlayerSelectPage({super.key});

  @override
  _PlayerSelectPageState createState() => _PlayerSelectPageState();
}

class _PlayerSelectPageState extends State<PlayerSelectPage> {
  final List<TextEditingController> playerControllers = List.generate(15, (_) => TextEditingController());
  final List<bool> isPlayingList = List.generate(15, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Select'),
        backgroundColor: const Color(0xFFFF3131),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Player Select',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              for (int i = 0; i < 15; i++) ...[
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: playerControllers[i],
                        decoration: InputDecoration(
                          labelText: 'Player ${i + 1}',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: isPlayingList[i],
                        onChanged: (value) {
                          setState(() {
                            isPlayingList[i] = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'is playing?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  List<String> activePlayers = [];
                  List<String> inactivePlayers = [];

                  for (int i = 0; i < isPlayingList.length; i++) {
                    if (isPlayingList[i]) {
                      activePlayers.add(playerControllers[i].text);
                    } else {
                      inactivePlayers.add(playerControllers[i].text);
                    }
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerConfirmationPage(
                        activePlayers: activePlayers,
                        inactivePlayers: inactivePlayers,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF3131),
                ),
                child: const Text('Next'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerConfirmationPage extends StatelessWidget {
  final List<String> activePlayers;
  final List<String> inactivePlayers;

  const PlayerConfirmationPage({super.key, required this.activePlayers, required this.inactivePlayers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Confirmation'),
        backgroundColor: const Color(0xFFFF3131),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Active Players',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            for (var player in activePlayers)
              Text(
                player,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            const SizedBox(height: 20),
            const Text(
              'Inactive Players',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            for (var player in inactivePlayers)
              Text(
                player,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyIns1Page(
                        activePlayers1: activePlayers,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF3131),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Start Game',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuyIns1Page extends StatefulWidget {
  final List<String> activePlayers1;
  
  const BuyIns1Page({super.key, required this.activePlayers1});
  
  @override
  _BuyIns1PageState createState() => _BuyIns1PageState();
}

class _BuyIns1PageState extends State<BuyIns1Page> {
  List<bool> playerSelections1 = [];

  @override
  void initState() {
    super.initState();
    playerSelections1 = List<bool>.generate(widget.activePlayers1.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Ins 1'),
        backgroundColor: const Color(0xFFFF3131),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Buy Ins 1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Select players to buy in:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.activePlayers1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.activePlayers1[index]),
                  leading: Checkbox(
                    value: playerSelections1[index],
                    onChanged: (value) {
                      setState(() {
                        playerSelections1[index] = value!;
                      });
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyIns2Page(activePlayers2: widget.activePlayers1, selections1: playerSelections1,)
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF3131),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuyIns2Page extends StatefulWidget {
  final List<String> activePlayers2;
  final List<bool> selections1; 
  
  const BuyIns2Page({super.key, required this.activePlayers2, required this.selections1});
  
  @override
  _BuyIns2PageState createState() => _BuyIns2PageState();
}

class _BuyIns2PageState extends State<BuyIns2Page> {
  List<bool> playerSelections2 = [];

  @override
  void initState() {
    super.initState();
    playerSelections2 = List<bool>.generate(widget.activePlayers2.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Ins 2'),
        backgroundColor: const Color(0xFFFF3131),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Buy Ins 2',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Select players to buy in:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.activePlayers2.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.activePlayers2[index]),
                  leading: Checkbox(
                    value: playerSelections2[index],
                    onChanged: (value) {
                      setState(() {
                        playerSelections2[index] = value!;
                      });
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyIns3Page(activePlayers3: widget.activePlayers2, selections1: widget.selections1, selections2: playerSelections2,)
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF3131),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuyIns3Page extends StatefulWidget {
  final List<String> activePlayers3;
  final List<bool> selections1;
  final List<bool> selections2;
  
  const BuyIns3Page({super.key, required this.activePlayers3, required this. selections1, required this.selections2});
  
  @override
  _BuyIns3PageState createState() => _BuyIns3PageState();
}

class _BuyIns3PageState extends State<BuyIns3Page> {
  List<bool> playerSelections3 = [];

  @override
  void initState() {
    super.initState();
    playerSelections3 = List<bool>.generate(widget.activePlayers3.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Ins 3'),
        backgroundColor: const Color(0xFFFF3131),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Buy Ins 3',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Select players to buy in:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.activePlayers3.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.activePlayers3[index]),
                  leading: Checkbox(
                    value: playerSelections3[index],
                    onChanged: (value) {
                      setState(() {
                        playerSelections3[index] = value!;
                      });
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalChipsPage(activePlayers: widget.activePlayers3, selections1: widget.selections1, selections2: widget.selections2, selections3: playerSelections3,)
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF3131),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinalChipsPage extends StatefulWidget {
  final List<String> activePlayers;
  final List<bool> selections1;
  final List<bool> selections2;
  final List<bool> selections3;

  const FinalChipsPage({super.key, required this.activePlayers, required this.selections1, required this.selections2, required this.selections3});

  @override
  _FinalChipsPageState createState() => _FinalChipsPageState();
}

class _FinalChipsPageState extends State<FinalChipsPage> {
  late List<int> _finalPlayerChips;

  @override
  void initState() {
    super.initState();
    _finalPlayerChips = List<int>.filled(widget.activePlayers.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Chips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Final Chips',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter the final chips for each player:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.activePlayers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.activePlayers[index]),
                  trailing: SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _finalPlayerChips[index] = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameSummaryPage(
                        activePlayers: widget.activePlayers,
                        selections1: widget.selections1,
                        selections2: widget.selections2,
                        selections3: widget.selections3,
                        finalChips: _finalPlayerChips,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class GameSummaryPage extends StatelessWidget {
  final List<String> activePlayers;
  final List<bool> selections1;
  final List<bool> selections2;
  final List<bool> selections3;
  final List<int> finalChips;

  const GameSummaryPage({super.key, 
    required this.activePlayers,
    required this.selections1,
    required this.selections2,
    required this.selections3,
    required this.finalChips,
  });

  @override
  Widget build(BuildContext context) {
    List<int> totalBuyIns = [];
    for (int i = 0; i < activePlayers.length; i++) {
      int count = 0;
      if (selections1[i]) count++;
      if (selections2[i]) count++;
      if (selections3[i]) count++;
      totalBuyIns.add(count);
    }

    List<int> netChips = [];
    List<int> netDollars = [];
    for (int i = 0; i < activePlayers.length; i++) {
    int netChipAmount = finalChips[i] - (40+(totalBuyIns[i] * chipAmount));
    int netDollarAmount = (finalChips[i] - (40 + (totalBuyIns[i] * chipAmount))) ~/ (chipAmount / dollarAmount);
    netChips.add(netChipAmount);
    netDollars.add(netDollarAmount);
    }

    List<String> optimizationSteps = performOptimization(activePlayers, finalChips, netDollars);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Game Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Buy-In Chart:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            DataTable(
              columns: const [
                DataColumn(
                  label: Text('Player'),
                ),
                DataColumn(
                  label: Text('Buy-In 1'),
                ),
                DataColumn(
                  label: Text('Buy-In 2'),
                ),
                DataColumn(
                  label: Text('Buy-In 3'),
                ),
              ],
              rows: List<DataRow>.generate(
                activePlayers.length,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Text(activePlayers[index]),
                    ),
                    DataCell(
                      Checkbox(
                        value: selections1[index],
                        onChanged: null,
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: selections2[index],
                        onChanged: null,
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: selections3[index],
                        onChanged: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Calculations:',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: activePlayers.length,
              itemBuilder: (context, index) {
                return Text(
                  '${activePlayers[index]} has ${totalBuyIns[index]} buy-ins.',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: activePlayers.length,
              itemBuilder: (context, index) {
                return Text(
                  '${activePlayers[index]} has ${40+(totalBuyIns[index] * chipAmount)} total chips.',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: activePlayers.length,
              itemBuilder: (context, index) {
                return Text(
                  '${activePlayers[index]} has ${finalChips[index]} final chips.',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: activePlayers.length,
              itemBuilder: (context, index) {
                return Text(
                  '${activePlayers[index]} has ${finalChips[index] - (40+(totalBuyIns[index] * chipAmount))} net chips.',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: activePlayers.length,
              itemBuilder: (context, index) {
                return Text(
                  '${activePlayers[index]} has ${(finalChips[index] - (40+(totalBuyIns[index] * chipAmount))) / (chipAmount / dollarAmount)} net dollars.',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            const SizedBox(height: 40),
            const Text(
              'Optimizations',
              style: TextStyle(
                fontSize: 30,
              ),
            ),

            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: optimizationSteps.length,
              itemBuilder: (context, index) {
                return Text(
                  optimizationSteps[index],
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                );
              },
            ),
            const SizedBox(height:50),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlayerSelectPage()),
                  );
                },
              child: const Text(
                'Start a New Game',
              style: TextStyle(fontSize: 22,
              )
             ),
            )
          ],
        ),
      ),
    );
  }

    List<String> performOptimization(List<String> players, List<int> chips, List<int> netDollars){
    List<String> optimizationSteps = [];
    Map<String, double> details = {};

    debugPrint("HERE IS THE DETAILS THING");
    
    for (int i = 0; i < players.length; i++) {
      String player = players[i];
      double netChipValue = netDollars[i].toDouble();
      details[player] = netChipValue;
      debugPrint("RAN ONCE");
    }
      debugPrint("net dollars is: $netDollars");
      debugPrint("players is: $players");
      print("details : $details");

    findPath(details, optimizationSteps);

    if (optimizationSteps.isEmpty) {
      optimizationSteps.add('Optimization not possible');
    }

    for (int i=0; i<optimizationSteps.length; i++) {
      debugPrint(optimizationSteps[i]);
    }

    return optimizationSteps;
  }

  void findPath(Map<String, double> details, List<String> optimizationSteps) {
  double maxValue = details.values.reduce((a, b) => a > b ? a : b);
  double minValue = details.values.reduce((a, b) => a < b ? a : b);

  debugPrint("ok finished finding out min and max");
  debugPrint("max value is: $maxValue"); 
  debugPrint("min value is: $minValue");

  if (maxValue != minValue) {
    debugPrint("ok now we are going through the 1 if statement");
    String maxKey = getKeyFromValue(details, maxValue);
    String minKey = getKeyFromValue(details, minValue);
    double result = maxValue + minValue;
    result = round(result, 1);
    debugPrint("result is: $result");

    if (result >= 0.0) {
      debugPrint("running through 2 if");
      optimizationSteps.add('$minKey needs to give $maxKey: ${round(minValue.abs(), 2)} dollars');
      debugPrint("steps now are: $optimizationSteps");
      details.remove(maxKey);
      details.remove(minKey);
      details[maxKey] = result;
      details[minKey] = 0.0;
    } else {
      debugPrint("running through 3 else");
      optimizationSteps.add('$minKey needs to give $maxKey: ${round(maxValue.abs(), 2)} dollars');
      details.remove(maxKey);
      details.remove(minKey);
      details[maxKey] = 0.0;
      details[minKey] = result;
    }

    findPath(details, optimizationSteps);
  }
}


  String getKeyFromValue(Map<String, double> map, double value) {
    for (String key in map.keys) {
      if (map[key] == value) {
        return key;
      }
    }
    return "";
  }

  double round(double value, int places) {
    if (places < 0) {
      throw ArgumentError('Decimal places must be greater than or equal to 0.');
    }

    num scaleFactor = pow(10, places);
    return (value * scaleFactor).round() / scaleFactor;
  }
}
