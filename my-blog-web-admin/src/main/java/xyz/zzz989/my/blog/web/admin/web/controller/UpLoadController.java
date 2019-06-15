package xyz.zzz989.my.blog.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @author ZJR
 */

@Controller
public class UpLoadController {

    private final static String UPLOAD_PATH = "/static/upload/";

    /**
     * 文件上传
     * @param dropFile 是dropzone的上传
     * @param editorFiles editormd的上传
     * @return
     */

    @ResponseBody
    @RequestMapping(value = "upload",method = RequestMethod.POST)
    public Map<String,Object> upload(MultipartFile dropFile, @RequestParam("editormd-image-file")MultipartFile[] editorFiles, HttpServletRequest request){
        Map<String, Object> result = new HashMap<>();

        if (dropFile != null){
            result.put("fileName",writeFile(dropFile, request));
        }

        if (editorFiles != null && editorFiles.length >0){
            List<String> fileNames = new ArrayList<>();
            for (MultipartFile editorFile : editorFiles) {
                fileNames.add(writeFile(editorFile, request));
            }
            result.put("success", 1);
            result.put("url", fileNames);
            result.put("message","上传成功");
        }
        return result;
    }

    /**
     *
     * @param multipartFile
     * @param request
     * @return 返回文件完整路径
     */

    private String writeFile(MultipartFile multipartFile, HttpServletRequest request){
        String fileName = multipartFile.getOriginalFilename();
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."));

        //文件存放路径
        String filePath = request.getSession().getServletContext().getRealPath(UPLOAD_PATH);
        //判断路径是否存在，不存在则创建文件夹
        File file = new File(filePath);
        if (!file.exists()){
            file.mkdir();
        }
        //将文件写入目标目录
        file = new File(filePath, UUID.randomUUID() + fileSuffix);

        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String serverPath = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort();
        return serverPath + UPLOAD_PATH +file.getName();
    }
}