package com.kiriya.service;

import com.kiriya.entity.Student;

import java.util.List;
import java.util.HashMap;

public interface StudentService {
    /**
     * 登录
     *
     * @param num
     * @return
     */
    Student getStuById(int num);

    /**
     * 获取所有课程
     *
     * @return
     */
    List<HashMap> getAllCourse();

    /**
     * 获取个人信息
     *
     * @param num
     * @return
     */
    List<HashMap> getMyMsg(int num);

    /**
     * 获取个人课程
     *
     * @param num
     * @return
     */
    List<HashMap> getMyCourse(int num);

    /**
     * 进行选课
     *
     * @param stuNum
     * @param courseNum
     * @return
     */
    Integer selectCourse(int stuNum, int courseNum);

    /**
     * 查询课程是否已选
     *
     * @param stuNum
     * @param courseNum
     * @return
     */
    Boolean ifCourseSelected(int stuNum, int courseNum);

    /**
     * 查询是否课程是否满人
     * @param courseNum
     * @return
     */
    Boolean ifCourseMembersLimit(int courseNum);

    /**
     * 删除选课
     *
     * @param stuNum
     * @param courseNum
     * @return
     */
    Integer deleteCourse(int stuNum, int courseNum);

    /**
     * 通过课程编号更新已选课程
     * @param courseNum
     * @return
     */
    Integer updateCourseSelectedMembers(int courseNum);
}
