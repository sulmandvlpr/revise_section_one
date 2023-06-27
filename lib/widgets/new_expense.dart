//hold form for adding new expnse  cliking on top bar button
//this widget class is stateful cause we have input form which need to update32[\p]o[]
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revise_section_one/models/expence.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

//craeat a fun to accept the NewExpense
  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _StateNewExpense();
  }
}

class _StateNewExpense extends State<NewExpense> {
// //old aproach
// //create a empty string variable later we set this variable to inputvalue passed by user
// var _enteredTitle = '';
//   //method to save input value
//   //Stg inputValue pass by flutter automaticlly
//   //
//   void _saveTitleInput(String inputValue){
//   _enteredTitle = inputValue;
//   }

//new aproach TextEditingContoller to controll user Input Text or
//controll editable text filed
//TextEditingContoller object handels the controlling by flutter
//📝we need to dispose this TextEditingContoller  when we are done our work
//other wise it will still runing even after the widget is disappear
  final _titleContoller = TextEditingController();
  final _amountController = TextEditingController();
//need a DateTime variable to hold the selected date
  DateTime? _selectedDate;

  //this variable stores dropdown selected value
  Category _selctedCategory = Category.food;

//open overlay date picker
  void _presentDatePicker() async {
    final now = DateTime.now();
    //last year
    final firstDate = DateTime(now.year - 1, now.month, now.day);
//show method always open overlay

//await this fuction wait for us to pick a date
//we save showDatePicker in variable pickedDate to expecte it later
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
// the line beneth this will only execute when the upper line execute

//caus this update the ui with new selected date
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialog() {
//plateform check
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please recheck the from you submitted wrong infromation'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Okay')),
                ],
              ));
    } else {
//show error message
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text(
                  'Please recheck the from you submitted wrong infromation'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Okay')),
              ],
            )),
      );
    }
  }

  void _submitExpenseData() {
//we need to velidate the user input date
//double.tryParse(stg) convert string to double and return double
    final enteredAmout = double.tryParse(_amountController.text);

    final amountIsInvalid = enteredAmout == null || enteredAmout <= 0;

// title
    if (_titleContoller.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialog();

      //when ever we return in a function after some code execution  we use return
      //so it will confirm that no code exectue after
      return;
    }
    //Create a new expense here
    widget.onAddExpense(Expense(
        title: _titleContoller.text,
        amount: enteredAmout,
        date: _selectedDate!,
        category: _selctedCategory));

    Navigator.pop(context);
  }

//dispose TextEditingContoller
  @override
  void dispose() {
    super.dispose();
    _titleContoller.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        //UI for form
        Padding(
      //giving padding to left,top all direction and give top to 48 so things like camera get some space
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child:
          //column for title input , amount , date inside of column we have row
          Column(
        children: [
          //title input element alow user to input text
          TextField(
            //TextEditedController Object
            controller: _titleContoller,
            maxLength: 50,
            //to label text input like title we use textDecoration
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          //row for Amount
          Expanded(
            child: Row(
              children: [
                //text field for amount
                TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(
                  width: 16,
                ),
                //row for date picker and date display
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null
                          ? 'No Date Selected'
                          : formatter.format(_selectedDate!)),
                      IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month)),
                    ],
                  ),
                )
              ],
            ),
          ),
          //row have category selection, cancle button and save expense button
          Row(
            children: [
              //categor selector
              //onChange(value){}  value here is seletd by drop down items
              //we have Cateroy enum but flutter wanted to to have List<DrpItems>
              //to convert enum values to List values we use map()

              //enum have porperty of values to access all enum values
              //enum have name property which is name of enum value
              DropdownButton(
                  value: _selctedCategory,
                  items: Category.values
                      .map(
                        //value here store Dropdown selected element internelly and this value also use in onChnage values
                        //.toUppercase convert every string latter to Capital
                        (category) => DropdownMenuItem(
                            child: Text(category.name.toUpperCase())),
                      )
                      .toList(),
                  onChanged: (value) {
                    //now we need to show seleted value so we need to store sleted value with defualt value
                    //show defulat value or selte new value and update ui

                    setState(() {
                      _selctedCategory = value;
                    });
                  }),
              //scapce btw widget
              const Spacer(),
              //button Cancel
              TextButton(
                  onPressed: () {
                    //Navigator obj Manages Screen/Routs bvndeethrf
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),

              //button SaveExpense
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('SaveExpense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
