
// "Mohamed Nabil"
// "Mohamed"
// "Mohamed "
//""
//null
String extractFirstName(String? fullName){
  if(fullName ==null) return "";
  return fullName.split(" ")[0];
}

// "Mohamed Nabil"
// "Mohamed"
// "Mohamed "
//""
//null
String extractSecondName(String? fullName){
  if(fullName ==null) return "";

  var parts =  fullName.split(" ");

  if(parts.length <2)return "";
  return parts[1];
}