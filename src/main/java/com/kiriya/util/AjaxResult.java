package com.kiriya.util;

/**
 * 将数据封装成用于easyui识别的ajax
 *
 * @author Kirito
 * @date 2020/12/23 15:08 <br>
 */
public class AjaxResult {
    private Boolean success = true;
    private String message = "";
    private Object data = null;

    public Boolean getSuccess() {
        return success;
    }

    public AjaxResult setSuccess(Boolean success) {
        this.success = success;
        return this;
    }

    public String getMessage() {
        return message;
    }

    public AjaxResult setMessage(String message) {
        this.message = message;
        return this;
    }

    public Object getData() {
        return data;
    }

    public AjaxResult setData(Object data) {
        this.data = data;
        return this;
    }

    @Override
    public String toString() {
        return "AjaxResult{" +
                "success=" + success +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }
}
