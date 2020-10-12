package com.fs.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

//파일명 재정의 객체만들기
//FileRenamePolicy인터페이스를 구현하면됨.
public class MyRenamePolicy implements FileRenamePolicy{


	@Override
	public File rename(File old) {
		File newFile=null;
		//중복되지않는 리네임규칙을 작성해야함.
		do {
			//이름을 중복되지않게 만들어보자
			long currentTime=System.currentTimeMillis();//현재날짜와 시간을 밀리세컨초로 가져오기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)(Math.random()*10000);
			String fileName=old.getName();//test.txt, a.jpg
			String ext="";
			int dot=fileName.lastIndexOf(".");
			if(dot>-1) {//if(dot!=-1)
				ext=fileName.substring(dot);
			}
			//새이름만들기
			String newName=sdf.format(new Date(currentTime))+"_"+rndNum+ext;
			newFile=new File(old.getParent(),newName);
		}while(!createNewFile(newFile));
		
		return newFile;
	}
	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();//파일생성메소드
		}catch(IOException e) {
			return false;
		}
	}
	
}