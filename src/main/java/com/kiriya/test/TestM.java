package com.kiriya.test;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class TestM {
    public static void main(String[] args) {
        String str="[12,14]";
        JSONArray jsonArray= JSONObject.parseArray(str);
        for (int i = 0; i < jsonArray.size(); i++) {
            System.out.println(jsonArray.get(i));
        }
    }
}
