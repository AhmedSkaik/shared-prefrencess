class Note {
   late int id ;
   late String title;
   late String info;
   late int UserId;

   Note();

Note.fromMap( {required Map<String, dynamic> rowMap}){
  id =rowMap['id'];
  title = rowMap['tittle'];
  info = rowMap['info'];
  UserId = rowMap['user_id'];
}

Map<String, dynamic> toMap(){
  Map<String,dynamic> map =<String, dynamic>{};
  map['title']= title;
  map['id']= id;
  map['info']= info;
  map['user_id']= UserId;
return map;
}

}