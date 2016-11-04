package com.kt.bdapportal.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kt.bdapportal.domain.BdapUser;

public class FileHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String TEMP_DIRECTORY = BbsConstant.FILE_TEMP_PATH;
  
	
    public FileHandler() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String reqUrl = request.getRequestURL().toString();
    	HttpSession session = request.getSession();
    	BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
   	 	
    	if(reqUrl.contains("fileUpload")){
		     if(ServletFileUpload.isMultipartContent(request)){ 
		         try { 
		        	  
		        	 request.setCharacterEncoding("UTF-8");
		             List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request); 
		             for(FileItem item : multiparts){ 
		                 if(!item.isFormField()){ 
		                     String name = new File(item.getName()).getName(); 
		                     File directory = new File(TEMP_DIRECTORY+File.separator+bdapUser.getUserId());
		         	        if(directory.exists() == false){
		         	        	directory.mkdirs();
		         	        }  
		         	       item.write( new File(TEMP_DIRECTORY+File.separator+bdapUser.getUserId()+ File.separator + name));
		                 } 
		             } 
		            request.setAttribute("message", "File Uploaded Successfully"); 
		         	}catch (Exception ex) { 
		            request.setAttribute("message", "File Upload Failed due to " + ex); 
		         }           
		     	}else{ 
		         request.setAttribute("message","Sorry this Servlet only handles file upload request"); 
		     } 
		//     request.getRequestDispatcher("/noticeList.do").forward(request, response); 
    	}else if(reqUrl.contains("fileDownload")){
    		String fileName = (String)request.getParameter("fileName");
    		String userId = (String)request.getParameter("userId");
    		
    		String[] fileNameArr = fileName.split("\\*");
			try {
				
				if(fileNameArr.length > 1){				
					  List<File> filelist = new ArrayList<File>();
					  for(int i = 0; i < fileNameArr.length; i++){
					    File filess = new File(TEMP_DIRECTORY + File.separator+userId+File.separator+ fileNameArr[i]);
					    filelist.add(filess);
					  }
					   response.setContentType("application/octet-stream;charset=UTF-8");
		               response.setHeader("Content-Disposition", "attachment; filename=downloadZip.zip" + ";");
		               response.setHeader("Pragma", "no-cache;");
		               response.setHeader("Expires", "-1;");
		               this.zip(filelist, new BufferedOutputStream(response.getOutputStream()),fileNameArr);
	    		}else{
	    			String serverFile = TEMP_DIRECTORY + File.separator+userId+File.separator+ fileNameArr[0];
	    			
	    			File downfile = new File(serverFile);
		    		if(!downfile.exists()) {
		    		        throw new FileNotFoundException();
		    		}
					BufferedInputStream fin = null;
					BufferedOutputStream fout = null;
					
					String encFileName = java.net.URLEncoder.encode(downfile.getName(), "UTF-8");	
					encFileName = encFileName.replaceAll("\\+", "%20"); 
					response.setContentType("application/octet-stream;charset=UTF-8");
					response.setHeader("Content-Disposition", "attachment; filename=" + encFileName+ ";");
					response.setHeader("Content-Transfer-Encoding", "binary;");
					response.setHeader("Pragma", "no-cache;");
					response.setHeader("Expires", "-1;");
	
					byte buf[] = new byte[2 * 1024];
					fin = new BufferedInputStream(new FileInputStream(serverFile));
					fout = new BufferedOutputStream(response.getOutputStream());
					int fread = 0;
	
					while ((fread = fin.read(buf)) != -1) {
						fout.write(buf, 0, fread);
					}
					if (fout != null) {
						fout.flush();
						fout.close();
					}
					if (fin != null) {
						fin.close();
					}
	    		}
			} catch (Exception e) {
				e.printStackTrace();
			} 
    	}
    }

	public void zip(List<File> src, BufferedOutputStream os,String[] fileName) throws IOException { 
        ZipArchiveOutputStream zos = new ZipArchiveOutputStream(os); 
        zos.setEncoding(Charset.defaultCharset().name()); 
        FileInputStream fis = null; 

        int length; 
        ZipArchiveEntry ze; 
        byte[] buf = new byte[8 * 1024]; 
        
        if (src.size() > 0) { 
            for (int i = 0; i < src.size(); i++) { 
                //System.out.println("name: " + fileName[i]); 
                ze = new ZipArchiveEntry(fileName[i]); 
                zos.putArchiveEntry(ze); 
                fis = new FileInputStream(src.get(i)); 
                while ((length = fis.read(buf, 0, buf.length)) >= 0) { 
                    zos.write(buf, 0, length); 
                } 
            } 
            fis.close(); 
            zos.closeArchiveEntry(); 
        } 
        zos.close(); 
    }   

    
    
}