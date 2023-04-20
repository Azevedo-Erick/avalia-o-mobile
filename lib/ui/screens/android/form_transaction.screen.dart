import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../blocs/form_transaction.bloc.dart';
import '../../../models/tipo_transacao.model.dart';

class FormTransactionScreen extends StatefulWidget {
  const FormTransactionScreen({super.key});

  @override
  State<FormTransactionScreen> createState() => _FormTransactionScreenState();
}

class _FormTransactionScreenState extends State<FormTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<FormTransactionBloc>(context);
    bloc.getAllCategories();
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2025));
      if (picked != null && picked != bloc.transaction!.data) {
        setState(() {
          bloc.transaction!.data = picked;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Transação"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                //validator: bloc.validateNome,
                onSaved: (value) => {bloc.transaction!.titulo = value!},
                decoration: const InputDecoration(
                    hintText: "Nome",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    fillColor: Color.fromARGB(22, 68, 137, 255),
                    filled: true,
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                //validator: bloc.validateNome,
                onSaved: (value) => {
                  value ?? (value = ""),
                  bloc.transaction!.descricao = value
                },
                decoration: const InputDecoration(
                    hintText: "Descricao",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    fillColor: Color.fromARGB(22, 68, 137, 255),
                    filled: true,
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                //validator: bloc.validateNome,
                onSaved: (value) => {
                  value ?? (value = "0"),
                  bloc.transaction!.valor = double.parse(value)
                },
                decoration: const InputDecoration(
                    hintText: "Valor",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    fillColor: Color.fromARGB(22, 68, 137, 255),
                    filled: true,
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () => {
                            bloc.transaction!.tipoTransacao =
                                TipoTransacao.entrada
                          },
                      child: const Text("Entrada")),
                  TextButton(
                      onPressed: () => {
                            bloc.transaction!.tipoTransacao =
                                TipoTransacao.gasto
                          },
                      child: const Text("Saída")),
                ],
              ),
              SizedBox(
                height: 35,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => {
                            bloc.transaction!.category = bloc.categories[index]
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.green),
                            child: Center(
                                child: Text(bloc.categories[index].name)),
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.grey),
                    itemCount: bloc.categories.length),
              ),
              TextButton(
                onPressed: () => {_selectDate(context)},
                child: const Text("Selecionar data"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () => {
                        if (_formKey.currentState!.validate())
                          {
                            _formKey.currentState!.save(),
                            setState(() {
                              bloc.salvar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Salvo'),
                                ),
                              );
                            })
                          },
                      },
                  child: const Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }
}
