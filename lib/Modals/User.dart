class User {
   late String name;
   late String email;
   late String password ;
   late int id;

   User({required String name, required String email});

   User.fromMap({  required Map<String , dynamic> rowMap }){
       id = rowMap['id'];
       name= rowMap['name'];
       email =rowMap['email'];
   }


Map<String, dynamic> toMap() {
     Map<String,dynamic> map = <String ,dynamic>{};
   map['name']=name;
   map['email']=email;
   map['password']=password;
     return map;
}


}
