package com.market.fileupload;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import net.coobird.thumbnailator.Thumbnails;

public class FileUpload {
  
 static final int width = 300;
 static final int height = 300;
 
 public static String fileUpload(String uploadPath, String fileName,
         byte[] fileData, String yPath) throws Exception {

	 //upload a file, and make its name
  UUID uid = UUID.randomUUID();
  
  String newName = uid + "_" + fileName;
  String imgPath = uploadPath + yPath;

  File save = new File(imgPath, newName);
  FileCopyUtils.copy(fileData, save);
  
  String thumb = "s_" + newName;
  File image = new File(imgPath + File.separator + newName);

  File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumb);

  if (image.exists()) {
   thumbnail.getParentFile().mkdirs();
   Thumbnails.of(image).size(width, height).toFile(thumbnail);
  }
  return newName;
 }

 public static String calcPath(String path) {
	 
	 //save images in following directory
  Calendar cal = Calendar.getInstance();
  String year = File.separator + cal.get(Calendar.YEAR);
  String month = year + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
  String date = month + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

  makeDir(path, year, month, date);
  makeDir(path, year, month, date + "\\s");

  return date;
 }

 private static void makeDir(String upath, String... paths) {

	 //save file
  if (new File(paths[paths.length - 1]).exists()) { return; }

  for (String path : paths) {
   File dirPath = new File(upath + path);

   if (!dirPath.exists()) {
    dirPath.mkdir();
   }
  }
 }
}