package com.common;

import java.util.Random;

public class RandomNumber {
	
	public static String randomNumber(int len, int dupCd ) {
        
        Random rand = new Random();
        String numStr = "";
        
        for(int i=0;i<len;i++) {
            
            //0~9 까지 난수 생성
            String ran = Integer.toString(rand.nextInt(10));
            
            //중복 허용            
            if(dupCd==1) {

                numStr += ran;
            //중복 미허용
            }else if(dupCd==2) {
                //중복된 값이 있는지 검사
                if(!numStr.contains(ran)) {
                    //중복된 값이 없으면 numStr에 append
                    numStr += ran;
                }else {
                    //중복되면 루틴을 다시 실행
                    i-=1;
                }
            }
        }
        return numStr;
    }

}