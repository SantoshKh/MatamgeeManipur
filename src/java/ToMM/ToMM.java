package ToMM;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SK
 */
public class ToMM {
    //eng to mm function...................................

    public String eng2mmChar(char pchar){
char mmarr[]={'\uABC0','\uABC1','\uABC2','\uABC3','\uABC4','\uABC5','\uABC6','\uABC7','\uABC8','\uABC9','\uABCA','\uABCB','\uABCC','\uABCD','\uABCE','\uABCF','\uABD0','\uABD1','\uABD2','\uABD3','\uABD4','\uABD5','\uABD6','\uABD7','\uABD8','\uABD9','\uABDA','\uABDB','\uABDC','\uABDD','\uABDE','\uABDF','\uABE0','\uABE1','\uABE2','\uABE3','\uABE4','\uABE5','\uABE6','\uABE7','\uABE8','\uABE9','\uABEA','\uABEC','\uABED','\uABF0','\uABF1','\uABF2','\uABF3','\uABF4','\uABF5','\uABF6','\uABF7','\uABF8','\uABF9'};

char engarr[]={'k','s','l','m','p','n','c','t','k','Z','T','w','y','h','U','I','f','A','g','J','r','b','j','d','G','D','v','Q','L','M','P','N','Y','H','I','0','o','i','a','e','E','u','O','q','.','_','1','2','3','4','5','6','7','8','9'};
		
		for(int j=0;j<engarr.length;j++){//alert(engarr[j]+"="+pchar);
			if(engarr[j]==pchar){//alert(mmarr[j]);
				return Character.toString(mmarr[j]); 
				}
		}
		return ""; 
	}
//................................................
    public String convert2MM(String u_name){
	 String final_u_name="";
	for(int i=0;i<u_name.length();i++){ 
		char c_char=u_name.charAt(i); c_char=Character.toLowerCase(c_char);
		String converted_value=eng2mmChar(c_char); 
		if(converted_value.equals("")){converted_value=Character.toString(c_char);}
		final_u_name=final_u_name+converted_value;
		}
                return final_u_name;
                }
}
