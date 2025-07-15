import 'package:flutter/material.dart';

class NetworkCalcScreen extends StatefulWidget {
  const NetworkCalcScreen({super.key});

  @override
  State<NetworkCalcScreen> createState() => _NetworkCalcScreenState();
}

class _NetworkCalcScreenState extends State<NetworkCalcScreen> {
  final TextEditingController ipController = TextEditingController();
  final List<Map<String, TextEditingController>> deptControllers = [];

  List<Map<String, String>> tableRows = [];
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    _addDepartment();
  }

  int _ipToInt(String ip) {
    final parts = ip.split('.').map(int.parse).toList();
    return (parts[0] << 24) + (parts[1] << 16) + (parts[2] << 8) + parts[3];
  }

  String _intToIp(int ip) {
    return [
      (ip >> 24) & 0xFF,
      (ip >> 16) & 0xFF,
      (ip >> 8) & 0xFF,
      ip & 0xFF
    ].join('.');
  }

  String _prefixToMask(int prefix) {
    int mask = 0xFFFFFFFF << (32 - prefix);
    return _intToIp(mask);
  }

  void _addDepartment() {
    setState(() {
      deptControllers.add({
        'name': TextEditingController(),
        'hosts': TextEditingController(),
      });
    });
  }

  void _removeDepartment(int index) {
    setState(() {
      deptControllers[index]['name']!.dispose();
      deptControllers[index]['hosts']!.dispose();
      deptControllers.removeAt(index);
    });
  }

  void calculateSubnets() {
    final input = ipController.text.trim();
    final parts = input.split('/');

    setState(() {
      errorMessage = "";
      tableRows = [];
    });

    if (parts.length != 2) {
      setState(() => errorMessage = "⚠ Please enter IP in this format: 192.168.1.0/24");
      return;
    }

    final ip = parts[0];
    final cidr = int.tryParse(parts[1]) ?? -1;
    if (cidr < 0 || cidr > 32) {
      setState(() => errorMessage = "⚠ CIDR must be between 0 and 32");
      return;
    }

    int baseIpInt = _ipToInt(ip);
    int baseEnd = baseIpInt + (1 << (32 - cidr));

    final departments = <Map<String, dynamic>>[];
    for (var controller in deptControllers) {
      final name = controller['name']!.text.trim();
      final hosts = int.tryParse(controller['hosts']!.text.trim()) ?? 0;
      if (name.isEmpty || hosts <= 0) {
        setState(() => errorMessage = "⚠ Please enter valid department names and host counts.");
        return;
      }
      departments.add({'name': name, 'hosts': hosts});
    }

    departments.sort((a, b) => b['hosts'].compareTo(a['hosts']));

    int nextIp = baseIpInt;

    for (var dept in departments) {
      int needed = dept['hosts'] + 2;
      int bits = (needed - 1).bitLength;
      int newPrefix = 32 - bits;
      int blockSize = 1 << (32 - newPrefix);
      int broadcast = nextIp + blockSize - 1;
      int firstHost = nextIp + 1;
      int lastHost = broadcast - 1;

      if (broadcast >= baseEnd) {
        setState(() => errorMessage = "⚠ Not enough space in base network to allocate all departments.");
        return;
      }

      tableRows.add({
        'Department': dept['name'],
        'Network': _intToIp(nextIp),
        'Broadcast': _intToIp(broadcast),
        'Mask': _prefixToMask(newPrefix),
        'Range': "${_intToIp(firstHost)} - ${_intToIp(lastHost)}",
        'Total': (blockSize - 2).toString(),
        'CIDR': '/$newPrefix'
      });

      nextIp += blockSize;
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
        title: const Text("Network Subnet Calculator"),
        titleTextStyle: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                      child: Text(
                        "Follow the guidelines below for use",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 40.0),
                      child: Text(
                        "🔹 Enter a base network (CIDR format)\n"
                            "🔹 Add department names with how many devices (hosts) they need.\n"
                            "🔹 Click Calculate to generate subnet plans.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: ipController,
                        decoration: InputDecoration(
                          labelText: "Base IP & CIDR (e.g. 192.168.1.0/24)",
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: theme.cardColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Text("Departments & Hosts",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const Spacer(),
                          ElevatedButton.icon(
                            onPressed: _addDepartment,
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: const Text("Add", style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: List.generate(deptControllers.length, (i) {
                          return Card(
                            color: theme.cardColor,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: deptControllers[i]['name'],
                                      decoration:
                                      const InputDecoration(labelText: "Department"),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      controller: deptControllers[i]['hosts'],
                                      decoration:
                                      const InputDecoration(labelText: "Hosts"),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => _removeDepartment(i),
                                    icon: Icon(Icons.delete,
                                        color: theme.colorScheme.error),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton.icon(
                        onPressed: calculateSubnets,
                        icon: const Icon(Icons.calculate, color: Colors.white),
                        label: const Text("Calculate Subnets"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          errorMessage,
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                      ),
                    const SizedBox(height: 20),
                    if (tableRows.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const Text("📊 Subnet Allocation Table",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text("Department")),
                                  DataColumn(label: Text("Network")),
                                  DataColumn(label: Text("Broadcast")),
                                  DataColumn(label: Text("Mask")),
                                  DataColumn(label: Text("Range")),
                                  DataColumn(label: Text("Total")),
                                  DataColumn(label: Text("CIDR")),
                                ],
                                rows: tableRows.map((row) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(row['Department']!)),
                                      DataCell(Text(row['Network']!)),
                                      DataCell(Text(row['Broadcast']!)),
                                      DataCell(Text(row['Mask']!)),
                                      DataCell(Text(row['Range']!)),
                                      DataCell(Text(row['Total']!)),
                                      DataCell(Text(row['CIDR']!)),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 30),
                    const Spacer(),
                    Center(
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "👨‍💻 Developed by Thamindu Kalhara",
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    ipController.dispose();
    for (var c in deptControllers) {
      c['name']!.dispose();
      c['hosts']!.dispose();
    }
    super.dispose();
  }
}
