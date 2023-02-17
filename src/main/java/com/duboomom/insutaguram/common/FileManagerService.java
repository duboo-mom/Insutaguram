package com.duboomom.insutaguram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	// public이라 갖다 쓸순 있지만 final 붙여서 수정은 불가능
	public static final String FILE_UPLOAD_PATH = "D:\\안미정\\springProject\\upload\\images";

	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, MultipartFile file) {
		
		// 지정한 경로에 파일을 저장하고 경로 리턴하는 메소드
		
		// 사용자별로 폴더 구분 = 사용자별로 폴더를 새로 만듦
		// 폴더이름: userId_unix time
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/" ;
		
		// 디렉토리 생성
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		
		if(directory.mkdir() == false) {
			// 디렉토리 생성 실패
			// 디렉토리 생성 실패 로그 추가 
			logger.error("savefile : 디렉토리 생성 실패 " + directoryPath);			
			return null;
		}
		
		// 파일 저장
		String filePath = null;		
		try {
			byte[] bytes = file.getBytes();
			
			filePath = directoryPath + file.getOriginalFilename();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			logger.error("saveFile : 파일 생성 에러 - " + filePath);
			
			return null;
		}
		
		// 클라이언트에 접근 가능한 경로를 문자열로 리턴
		// /images/1_1231354434/test.jpg		
		return "/images" + directoryName + file.getOriginalFilename();
		
	}
	
}
