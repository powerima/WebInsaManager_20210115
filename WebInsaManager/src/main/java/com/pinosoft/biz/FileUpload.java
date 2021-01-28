package com.pinosoft.biz;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

// ���� ���ε� ��ƿ
public class FileUpload {	
	// ���� ���ε�
	public static String uploadNewFile(HttpServletRequest request, String path, 
				MultipartFile uploadFile) throws IllegalStateException, IOException {
		String realPath = request.getSession().getServletContext().getRealPath(path);	// ���� ���
		String fileName = "";	// ������ ���� ���� �̸�
		
		if(uploadFile != null && !uploadFile.isEmpty()) {	// ���ε�� ���� ���� ���� Ȯ��
			
			
			String originalFileName = uploadFile.getOriginalFilename();	// �����̸� ����
			File f = new File(realPath + originalFileName);
			
			if (f.exists()) {	// ���� �̸� �ߺ��� ���ϱ� ����
				// �����Ͻú��� ���ڿ��� ����
				String time = new SimpleDateFormat("yyyyMMddhhmmss").format(System.currentTimeMillis());
				
				// �����̸� �ߺ��� ���ϱ� ���� �����Ͻú��� ���� ����
				fileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + '_' + time 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));				
			} else {	// �ߺ��� ������ ���� ���
				fileName = originalFileName;
			}

			System.out.println(realPath);
			uploadFile.transferTo(new File(realPath + fileName));	// ���� ���ε�			
		}
		
		return fileName;
	}
	
	// ���� ���� �����ϰ� ���ο� ���� ���ε�
	public static String updateFile(HttpServletRequest request, String path, 
				String preFileName, MultipartFile uploadFile) throws IllegalStateException, IOException {
		String realPath = request.getSession().getServletContext().getRealPath(path);	// ���� ���
		String fileName = "";	// ������ ���� ���� �̸�
		
		if(uploadFile != null && !uploadFile.isEmpty()) {	// ���ε�� ���� ���� ���� Ȯ��			
			// ���� ���� ����			
			File pref = new File(realPath + preFileName);
			if(pref.exists()) {
				pref.delete();
			}
			
			// ���ο� ���� ���ε�
			String originalFileName = uploadFile.getOriginalFilename();	// �����̸� ����
			File f = new File(realPath + originalFileName);
			
			if (f.exists()) {	// ���� �̸� �ߺ��� ���ϱ� ����
				// �����Ͻú��� ���ڿ��� ����
				String time = new SimpleDateFormat("yyyyMMddhhmmss").format(System.currentTimeMillis());
				
				// �����̸� �ߺ��� ���ϱ� ���� �����Ͻú��� ���� ����
				fileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + time 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));				
			} else {	// �ߺ��� ������ ���� ���
				fileName = originalFileName;
			}

			uploadFile.transferTo(new File(realPath + fileName));	// ���� ���ε�			
		} 
		
		return fileName;
	}
	
	// ���ε�� ���� ����
	public static void deleteFile(HttpServletRequest request, String path, String fileName) {
		String realPath = request.getSession().getServletContext().getRealPath(path);	// ���� ���
		
		if(fileName != null && !fileName.equals("")) {	// ���ε�� ���� ���� ���� Ȯ��
			File f = new File(realPath + fileName);
			f.delete();			// ���� ����
		}
	}
	
}
