import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product_provider.dart';
import 'package:shop_app/provider/productmodel.dart';

class Usereditscreen extends StatefulWidget {
  static const routname = "/usereditscreen";
  Usereditscreen({Key? key}) : super(key: key);

  @override
  _UsereditscreenState createState() => _UsereditscreenState();
}

class _UsereditscreenState extends State<Usereditscreen> {
  void initState() {
    super.initState();
  }

  var isinit = true;
  var isloading = false;

  @override
  void didChangeDependencies() {
    if (isinit) {
      var productid = ModalRoute.of(context)!.settings.arguments as String?;
      if (productid != null) {
        Product pro = Provider.of<Productprovider>(context).findById(productid);

        //print(pro.title);
        editedproduct = pro;
        initialvalue = {
          "title": editedproduct.title!,
          "price": editedproduct.price.toString(),
          "description": editedproduct.description!,
        };
        imagecontroller.text = editedproduct.imageUrl!;
      }
    }
    isinit = false;

    super.didChangeDependencies();
  }

  var pricefocusnode = FocusNode();
  var descriptionfocus = FocusNode();
  var imagecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  // var imagefocusnode = FocusNode();

  // validator
  var pricevalidator = MultiValidator([
    RequiredValidator(errorText: "This field is required"),
    PatternValidator(r"[0-9]+", errorText: "please fill amount"),
  ]);
  var titlevalidator = MultiValidator([
    RequiredValidator(errorText: "This field is required"),
    PatternValidator(r'[a-zA-Z]', errorText: "please enter valid product name"),
  ]);
  var urlvalidator = MultiValidator([
    RequiredValidator(errorText: "This field is required"),
    PatternValidator(
        r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-@]+))*$",
        errorText: "invalid url")
  ]);
  var descriptionvalidator = MultiValidator([
    RequiredValidator(errorText: "This field is required"),
    PatternValidator(r'[a-zA-Z]',
        errorText: "please enter product description"),
  ]);

  var editedproduct = Product(
    id: DateTime.now().toString(),
    title: "",
    description: "",
    price: 0.0,
    imageUrl: "",
  );
  var initialvalue = {
    "title": "",
    "price": "",
    "description": "",
  };
  void save() async {
    final valid = formkey.currentState!.validate();
    final produ = Provider.of<Productprovider>(context, listen: false);
    List<Product> useitem = produ.items;
    var test = useitem.where((element) => element.id == editedproduct.id);
    if (!valid) {
      return;
    }
    formkey.currentState!.save();
    setState(() {
      isloading = true;
    });

    //print(editedproduct.id);

    // print(editedproduct.id);
    //print(test);
    //print(useitem.length);
    // print(useitem[2].id);
    if (test.isNotEmpty) {
      await produ.updateproduct(editedproduct);
    } else {
      try {
        await Provider.of<Productprovider>(context, listen: false)
            .addproduct(editedproduct);
      } catch (e) {
        await showDialog<Null>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("An error occured"),
                  content: Text("something went worng"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("okay"))
                  ],
                ));
      }
      // finally {
      //   setState(() {
      //     isloading = false;
      //   });
      //   Navigator.of(context).pop();
      // }

      //     setState(() {
      //   isloading = false;
      // });

    }
    setState(() {
      isloading = false;
    });
    Navigator.of(context).pop();

    // if (!useitem.contains(editedproduct.id)) {
    //   produ.updateproduct(editedproduct);
    // }
    // else{

    // }

    // print(editedproduct.description);

    // print(editedproduct.imageUrl);

    // print(editedproduct.price);
    // print(editedproduct.title);
  }

  // @override
  // void dispose() {

  //   pricefocusnode.dispose();
  //   descriptionfocus.dispose();
  //   imagecontroller.dispose();
  //   editedproduct.dispose();

  //   super.dispose();
  // }

  //var
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [IconButton(onPressed: () => save(), icon: Icon(Icons.save))],
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: initialvalue["title"],
                            validator: titlevalidator,
                            // (value) {
                            //   if (value!.isEmpty) {
                            //     return " please enter the title";
                            //   }
                            //   if (value.contains("@")) {
                            //     return "please remove special characters";
                            //   }

                            //   return null;
                            // },
                            onSaved: (v) {
                              editedproduct = editedproduct.copyWith(
                                  title: v, id: editedproduct.id);
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(pricefocusnode);
                            },
                            decoration: InputDecoration(
                                // errorText: "azdf",
                                border: OutlineInputBorder(),
                                // enabledBorder: InputBorder.none,
                                //enabledBorder: InputBorder.none,

                                hintText: "Title"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: initialvalue["price"],
                            validator: pricevalidator,
                            onSaved: (v) {
                              editedproduct = editedproduct.copyWith(
                                  price: double.parse(v!),
                                  id: editedproduct.id);
                            },
                            focusNode: pricefocusnode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(descriptionfocus);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // enabledBorder: InputBorder.none,
                                //enabledBorder: InputBorder.none,

                                hintText: "Price"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: initialvalue["description"],
                            validator: titlevalidator,
                            onSaved: (v) {
                              editedproduct = editedproduct.copyWith(
                                  description: v, id: editedproduct.id);
                            },
                            focusNode: descriptionfocus,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // enabledBorder: InputBorder.none,
                                //enabledBorder: InputBorder.none,

                                hintText: "Description"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: urlvalidator,
                            //focusNode: imagefocusnode,
                            onSaved: (v) {
                              editedproduct = editedproduct.copyWith(
                                  imageUrl: v, id: editedproduct.id);
                            },
                            onFieldSubmitted: (_) {
                              save();
                            },
                            onChanged: (value) {
                              setState(() {
                                imagecontroller.text = value;
                              });
                            },
                            textInputAction: TextInputAction.done,

                            controller: imagecontroller,
                            // maxLines: 3,
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedErrorBorder: InputBorder.none,
                                // errorText: "please enter the valid url",
                                // enabledBorder: InputBorder.none,
                                //enabledBorder: InputBorder.none,

                                hintText: "imageurl"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          imagecontroller.text.isEmpty
                              ? Text("Please Enter The Image URL")
                              : Container(
                                  height: 300,
                                  width: 300,
                                  child: Image.network(imagecontroller.text))
                        ],
                      ))
                ],
              ),
            ),
    );
  }
}
