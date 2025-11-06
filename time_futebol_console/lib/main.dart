// Aplicativo Flutter: exibe na tela o elenco do time de futebol
// Mantém a classe e os dados da Parte 1, agora integrados à UI.
import 'package:flutter/material.dart';

class Jogador {
	final int id;
	final String nome;
	final String posicao;
	final int golsMarcados;
	final double valorDeMercado;

	Jogador({
		required this.id,
		required this.nome,
		required this.posicao,
		required this.golsMarcados,
		required this.valorDeMercado,
	});
}

// Dados de exemplo (poderiam vir de um repositório/serviço)
final List<Jogador> initialElenco = [
	Jogador(id: 1, nome: 'João Silva', posicao: 'Atacante', golsMarcados: 12, valorDeMercado: 75.0),
	Jogador(id: 2, nome: 'Carlos Pereira', posicao: 'Meia', golsMarcados: 7, valorDeMercado: 42.5),
	Jogador(id: 3, nome: 'Rafael Souza', posicao: 'Zagueiro', golsMarcados: 1, valorDeMercado: 28.0),
	Jogador(id: 4, nome: 'Pedro Santos', posicao: 'Atacante', golsMarcados: 0, valorDeMercado: 18.0),
	Jogador(id: 5, nome: 'Lucas Almeida', posicao: 'Goleiro', golsMarcados: 0, valorDeMercado: 15.0),
];

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Time de Futebol',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
				useMaterial3: true,
			),
			home: const PlayersPage(),
		);
	}
}

class PlayersPage extends StatefulWidget {
	const PlayersPage({super.key});

	@override
	State<PlayersPage> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
	late List<Jogador> _jogadores;

	@override
	void initState() {
		super.initState();
		_jogadores = List<Jogador>.of(initialElenco);
	}

	String _badge(Jogador j) {
		if (j.golsMarcados >= 10) return 'DESTAQUE';
		if (j.valorDeMercado > 50) return 'INVESTIMENTO';
		if (j.golsMarcados == 0 && j.posicao != 'Goleiro') return 'ALERTA';
		return '';
	}

	void _adicionarJogador() {
		setState(() {
			final nextId = _jogadores.isEmpty ? 1 : (_jogadores.map((j) => j.id).reduce((a, b) => a > b ? a : b) + 1);
			_jogadores.add(
				Jogador(
					id: nextId,
					nome: 'Novo Jogador $nextId',
					posicao: 'Meia',
					golsMarcados: 0,
					valorDeMercado: 10.0,
				),
			);
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Elenco do Time'),
			),
			body: ListView.builder(
				itemCount: _jogadores.length,
				itemBuilder: (context, index) {
					final jogador = _jogadores[index];
					final badge = _badge(jogador);
					return Card(
						margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
						child: ListTile(
							leading: CircleAvatar(
								backgroundColor: Colors.green.shade700,
								child: Text(jogador.id.toString(), style: const TextStyle(color: Colors.white)),
							),
							title: Text('${jogador.nome} (${jogador.posicao})'),
							subtitle: Text('Gols: ${jogador.golsMarcados}  •  Valor: R\$ ${jogador.valorDeMercado.toStringAsFixed(2)} mi'),
							trailing: badge.isEmpty
								? null
								: Container(
									padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
									decoration: BoxDecoration(
										borderRadius: BorderRadius.circular(12),
										color: badge == 'ALERTA' ? Colors.red.shade100 : Colors.green.shade100,
									),
									child: Text(
										badge,
										style: TextStyle(
											fontWeight: FontWeight.w600,
											color: badge == 'ALERTA' ? Colors.red.shade800 : Colors.green.shade800,
										),
									),
								),
						),
					);
				},
			),
			floatingActionButton: FloatingActionButton.extended(
				onPressed: _adicionarJogador,
				icon: const Icon(Icons.add),
				label: const Text('Adicionar'),
			),
		);
	}
}

