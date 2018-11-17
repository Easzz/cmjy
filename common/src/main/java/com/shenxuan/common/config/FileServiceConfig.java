package com.shenxuan.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 文件服务器地址
 * User: monkey
 * Date: 2018-10-24 18:15
 */
@Component
@ConfigurationProperties(prefix = "fileservice")
public class FileServiceConfig {
    
    /**
     * 上传路径
     */
    private String serverurl;

    public String getServerurl() {
        return serverurl;
    }

    public void setServerurl(String serverurl) {
        this.serverurl = serverurl;
    }
}
