package com.wz.emptyframe.controller.system;

import com.wz.emptyframe.dto.WebDTO;
import com.wz.emptyframe.entity.system.FileInfo;
import com.wz.emptyframe.serivce.system.FileService;
import com.wz.emptyframe.serivce.system.UserService;
import com.wz.emptyframe.util.file.SftpUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author ta0546 wz
 * @time 2019/9/30
 */
@RequestMapping(value = "/file")
@RestController
@Api(description="文件管理")
public class FileController {

    @Autowired
    @Qualifier("fileServiceImpl")
    private FileService fileService;

    @PostMapping("/uploadMultipleFiles")
    @ApiOperation(value = "上传多个文件(请使用POSTMAN工具测试，Swagger不支持)")
    public Object uploadMultipleFiles(@ApiParam(value = "文件", name = "file") MultipartFile[] files) {
        List<FileInfo> fileInfoList = fileService.saveFile(files);
        return WebDTO.success(fileInfoList);
    }

}