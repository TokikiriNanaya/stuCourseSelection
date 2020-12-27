package com.kiriya.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kiriya.dao.StudentDao;
import com.kiriya.entity.Student;
import com.kiriya.service.StudentService;
import com.kiriya.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Kirito
 * @date 2020/12/25 16:30 <br>
 * 学生
 */
@Controller
@RequestMapping(value = "/student", produces = {"application/json;charset=UTF-8"})
public class StudentController {
    @Autowired
    StudentService studentService;

    /**
     * 登录
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/login")
    public AjaxResult login(HttpServletResponse response, String username, String password, HttpSession session) {
        System.out.println("执行登录:" + username + " " + password);
        try {
            int num = Integer.parseInt(username);
            Student student = studentService.getStuById(num);
            //判断密码是否正确
            if (password.equals(student.getPassword())) {
                System.out.println("登录成功");
                //用户信息存入session
                session.setAttribute("student", student);
                return new AjaxResult().setSuccess(true).setMessage("登录成功").setData("index");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("用户名或密码错误");
        return new AjaxResult().setSuccess(false).setMessage("用户名或密码错误").setData("loginPage");
    }

    /**
     * 查询所有课程
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getAllCourse")
    public String getAllCourse() {
        String allCourse = JSON.toJSONString(studentService.getAllCourse());
        System.out.println("查询所有课程:\n" + allCourse);
        return allCourse;
    }

    /**
     * 查询我的课程
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getMyCourse")
    public String getMyCourse(HttpSession session) {
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            return null;
        }
        String myCourse = JSON.toJSONString(studentService.getMyCourse(student.getNum()));
        System.out.println("查询所有课程:\n" + myCourse);
        return myCourse;
    }

    /**
     * 注销
     *
     * @param session
     */
    @ResponseBody
    @RequestMapping("/logOut")
    public void logOut(HttpSession session) {
        session.removeAttribute("student");
        System.out.println("注销");
    }


    @ResponseBody
    @RequestMapping("/selectCourses")
    public AjaxResult selectCourses(String courseNums, HttpSession session) {
        System.out.println(courseNums);
        try {
            JSONArray jsonArray = JSONObject.parseArray(courseNums);
            Student student = (Student) session.getAttribute("student");
            int stuNum = student.getNum();
            for (int i = 0; i < jsonArray.size(); i++) {
                int courseNum = (int) jsonArray.get(i);
                //判断课程是否已选
                if (!studentService.ifSelected(stuNum, courseNum)) {
                    studentService.selectCourse(stuNum, courseNum);
                }
            }
            return new AjaxResult().setSuccess(true).setMessage("选课成功！");
        } catch (Exception e) {
            return new AjaxResult().setSuccess(false).setMessage(e.getMessage());
        }
    }
    @ResponseBody
    @RequestMapping("/deleteCourses")
    public AjaxResult deleteCourses(String courseNums, HttpSession session) {
        System.out.println(courseNums);
        try {
            JSONArray jsonArray = JSONObject.parseArray(courseNums);
            Student student = (Student) session.getAttribute("student");
            int stuNum = student.getNum();
            for (int i = 0; i < jsonArray.size(); i++) {
                int courseNum = (int) jsonArray.get(i);
                //判断课程是否已选
                if (studentService.ifSelected(stuNum, courseNum)) {
                    studentService.deleteCourse(stuNum, courseNum);
                }
            }
            return new AjaxResult().setSuccess(true).setMessage("取消选课成功！");
        } catch (Exception e) {
            return new AjaxResult().setSuccess(false).setMessage(e.getMessage());
        }
    }
}
