package com.pinosoft.biz;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

// 파일 업로드 유틸
public class FileUpload {	
	// 파일 업로드
	public static String uploadNewFile(HttpServletRequest request, String path, 
				MultipartFile uploadFile) throws IllegalStateException, IOException {
		String realPath = request.getSession().getServletContext().getRealPath(path);	// 실제 경로
		String fileName = "";	// 수정된 실제 파일 이름
		
		if(uploadFile != null && !uploadFile.isEmpty()) {	// 업로드된 파일 존재 여부 확인
			
			
			String originalFileName = uploadFile.getOriginalFilename();	// 파일이름 추출
			File f = new File(realPath + originalFileName);
			
			if (f.exists()) {	// 파일 이름 중복을 피하기 위한
				// 연월일시분초 문자열로 추출
				String time = new SimpleDateFormat("yyyyMMddhhmmss").format(System.currentTimeMillis());
				
				// 파일이름 중복을 피하기 위한 연월일시분초 문자 연결
				fileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + '_' + time 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));				
			} else {	// 중복된 파일이 없는 경우
				fileName = originalFileName;
			}

			System.out.println(realPath);
			uploadFile.transferTo(new File(realPath + fileName));	// 파일 업로드			
		}
		
		return fileName;
	}
	
	// 기존 파일 삭제하고 새로운 파일 업로드
	public static String updateFile(HttpServletRequest request, String path, 
				String preFileName, MultipartFile uploadFile) throws IllegalStateException, IOException {
		String realPath = request.getSession().getServletContext().getRealPath(path);	// 실제 경로
		String fileName = "";	// 수정된 실제 파일 이름
		
		if(uploadFile != null && !uploadFile.isEmpty()) {	// 업로드된 파일 존재 여부 확인			
			// 기존 파일 삭제			
			File pref = new File(realPath + preFileName);
			if(pref.exists()) {
				pref.delete();
			}
			
			// 새로운 파일 업로드
			String originalFileName = uploadFile.getOriginalFilename();	// 파일이름 추출
			File f = new File(realPath + originalFileName);
			
			if (f.exists()) {	// 파일 이름 중복을 피하기 위한
				// 연월일시분초 문자열로 추출
				String time = new SimpleDateFormat("yyyyMMddhhmmss").format(System.currentTimeMillis());
				
				// 파일이름 중복을 피하기 위한 연월일시분초 문자 연결
				fileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + time 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));				
			} else {	// 중복된 파일이 없는 경우
				fileName = originalFileName;
			}

			uploadFile.transferTo(new File(realPath + fileName));	// 파일 업로드			
		} 
		
		return fileName;
	}
	
	// 업로드된 파일 삭제
	public static void deleteFile(HttpServletRequest request, String path, String fileName) {
		String realPath = request.getSession().getServletContext().getRealPath(path);	// 실제 경로
		
		if(fileName != null && !fileName.equals("")) {	// 업로드된 파일 존재 여부 확인
			File f = new File(realPath + fileName);
			f.delete();			// 파일 삭제
		}
	}
	
}
