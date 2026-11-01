import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final pesanController = TextEditingController();

  final List<Map<String, dynamic>> pesan = [
    {'teks': 'Selamat datang, ada yang bisa dibantu?', 'dariSaya': false},
  ];

  void kirimPesan() {
    if (pesanController.text.trim().isEmpty) return;

    setState(() {
      pesan.add({'teks': pesanController.text.trim(), 'dariSaya': true});

      pesanController.clear();
    });
  }

  @override
  void dispose() {
    pesanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tanya Petugas')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: pesan.length,
              itemBuilder: (context, index) {
                final data = pesan[pesan.length - 1 - index];

                final dariSaya = data['dariSaya'] as bool;

                return Align(
                  alignment: dariSaya
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: dariSaya ? Colors.deepPurple : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      data['teks'],
                      style: TextStyle(
                        color: dariSaya ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pesanController,
                    decoration: const InputDecoration(
                      hintText: 'Tulis pesan...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send), onPressed: kirimPesan),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
