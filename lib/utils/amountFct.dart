String formatAmount(String v){

  /*
  * Return a amount string with space/comma separation
  *  16578.78 -> 16,578.78
  * 
  * params: String (v)
  * return: String (priceInTextFinal)
  */

    List<String> vSplit = v.split(".") ;
    String price = vSplit[0];
    String priceInText = "";
    int counter = 0;
    for(int i = (price.length - 1);  i >= 0; i--){
        counter++;
        String str = price[i];
        if((counter % 3) != 0 && i !=0){
          priceInText = "$str$priceInText";
        }else if(i == 0 ){
          priceInText = "$str$priceInText";
        
        }else{
          priceInText = ",$str$priceInText";
        }
    }

    String priceInTextFinal = priceInText.trim();

    if(vSplit.length==2){
      priceInTextFinal = priceInTextFinal+"."+vSplit[1];
    }
    
    return priceInTextFinal;
  }
