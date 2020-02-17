import 'package:flutter/material.dart';

class AddElementForm extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: AddingFormWidget(),
        color: Theme.of(context).backgroundColor,
      ),
    );
  }
}

class AddingFormWidget extends StatefulWidget {
  AddingFormWidget({Key key}) : super(key: key);

  @override
  _AddingFormWidgetState createState() => _AddingFormWidgetState();
}

class _AddingFormWidgetState extends State<AddingFormWidget> {

  final _formKey = GlobalKey<FormState>();

  @override 
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Add an ingredient...',
              labelStyle: Theme.of(context).textTheme.body2,
            ),
            style: Theme.of(context).textTheme.title,
            validator: (value) {
              if(value.isEmpty) {
                return 'Please add an ingredient';
              }
              return null;
            },
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(
                  height: 50
                ),
                child: RaisedButton(
                  onPressed: () {
                    if(_formKey.currentState.validate()){

                    }
                  },
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(50),
                      right: Radius.circular(50)
                    )
                  ),
                  child: Text('Submit'),
                ),
              ),
            ),
          ],
        ),
    );
  }
}