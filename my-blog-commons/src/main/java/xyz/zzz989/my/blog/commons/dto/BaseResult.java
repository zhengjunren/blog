package xyz.zzz989.my.blog.commons.dto;

import java.io.Serializable;

/**
 * @author ZJR
 */

public class BaseResult implements Serializable {
    public final static int STATUS_SUCCESS = 200;
    public final static int STATUS_FAIL = 500;
    private String message;
    private int status;
    private Object data;


    public static BaseResult success(){
        return BaseResult.createResult(STATUS_SUCCESS,"成功", null);
    }

    public static BaseResult success(String message){
        return BaseResult.createResult(STATUS_SUCCESS,message, null);
    }

    public static BaseResult success(String message, Object data){
        return BaseResult.createResult(STATUS_SUCCESS, message, data);
    }

    public static BaseResult fail(){
        return BaseResult.createResult(STATUS_FAIL,"失败", null);
    }

    public static BaseResult fail(String message){
        return BaseResult.createResult(STATUS_FAIL,message, null);
    }

    public static BaseResult fail(int status,String message){
        return BaseResult.createResult(status,message, null);
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    private static BaseResult createResult(int status, String message, Object data){
        BaseResult baseResult = new BaseResult();
        baseResult.setMessage(message);
        baseResult.setStatus(status);
        baseResult.setData(data);
        return baseResult;
    }
}
