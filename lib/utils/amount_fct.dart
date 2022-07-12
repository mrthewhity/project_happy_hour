String formatAmount(String amount){

  /*
  * Return a amount string with space/comma separation
  *  16578.78 -> 16,578.78
  * 
  * params: String (amount)
  * return: String (priceInTextFinal)
  */

    List<String> amountSplit = amount.split(".") ;
    String price = amountSplit[0];
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

    if(amountSplit.length==2){
      priceInTextFinal = priceInTextFinal+"."+amountSplit[1];
    }
    
    return priceInTextFinal;
  }
