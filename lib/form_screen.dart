import 'package:flutter/material.dart';  

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

   final _formfield = GlobalKey<FormState>();
   final emailController = TextEditingController(); 
   final passController = TextEditingController(); 
   bool passToggle = true; 

   

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(  
        title: Text("Form Page"), 
        centerTitle: true,
      ),
      body: SingleChildScrollView(   
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 60), 
        child: Form( 
          key: _formfield,
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              Image.asset("assets/images/coin.png", 
              height: 200, width: 200,),
              SizedBox(height: 50,) , 
              TextFormField(
                keyboardType: TextInputType.emailAddress, 
                 controller:emailController , 
                decoration: InputDecoration(  
                  labelText: "Email", 
                  border: OutlineInputBorder(), 
                  prefixIcon: Icon(Icons.email),  
                ),
                validator: (value){

                  bool emailValid = RegExp( 
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

                  if(value.isEmpty){
                    return "Enter  Email";
                  }
                else  if(emailValid){
               return "Enter Valid Email";
    }
                  
    
  
                },
              ), 
          
SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.emailAddress, 
                controller: passController, 
                obscureText: passToggle,
                decoration: InputDecoration(  
                  labelText: "Password",
                   
                  border: OutlineInputBorder(), 
                  prefixIcon: Icon(Icons.lock), 
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle; 
                      });
                    },
                    child: Icon(
                      passToggle ? Icons.visibility : Icons.visibility_off
                    ),
                  ),  
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Password";
                  }else if(passController.text.length<6){
                    return "Password length should  be more than 6 character";
                  }
                },
              ), 
              SizedBox(height: 60,), 

              InkWell(
                onTap: (){
                  if(_formfield.currentState!.validate()){
                    print("Data Added Successfully"); 
                    emailController.clear();
                    passController.clear();
                  }
                }, 
                child: Container(
                  height: 50, 
               
                  
                  decoration: BoxDecoration(  
                    borderRadius: BorderRadius.circular(5), 
                    color: Colors.indigo, 
                    
                  ),
                  child: Center(
                    child: Text("Log In" , style: TextStyle(
                       
                      fontSize: 20 , 
                      color: Colors.white, 
                      fontWeight: FontWeight.bold, 
                    ),),
                  ),
                ),
              ), 
SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                  style: TextStyle(
                       
                      fontSize: 17, 
                      
                    ), 
                  ), 
                  TextButton(onPressed: () {}, 
                  child: Text("Sign Up", 
                  style: TextStyle(
                       
                      fontSize: 18 , 
                     
                      fontWeight: FontWeight.bold, 
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
        ),
      ),
    );
    
  }
}