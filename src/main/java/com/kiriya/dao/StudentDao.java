package com.kiriya.dao;

import com.kiriya.entity.Student;

import java.util.List;
import java.util.HashMap;

/**
 * @author Kirito
 * 主dao
 * @date 2020/12/21 16:02 <br>
 */
public interface StudentDao {
    /**
     * 根据学号查询密码
     *
     * @param num 学号
     * @return 密码
     */
    Student getStuById(int num);

    /**
     * 查询所有课程
     *
     * @return 课程信息
     */
    List<HashMap> getAllCourse();

    /**
     * 查询我的课程
     *
     * @param num 学生编号
     * @return 课程信息
     */
    List<HashMap> getMyCourse(int num);

    /**
     * 选课（添加一条用户的课程数据）
     *
     * @param stuNum    学生编号
     * @param courseNum 课程编号
     * @return 影响数据条数
     */
    Integer selectCourse(int stuNum, int courseNum);

    /**
     * 查询课程是否已选过
     * @param stuNum 学生编号
     * @param courseNum 课程编号
     * @return 匹配个数 1为已选 0为未选
     */
    Integer ifSelected(int stuNum, int courseNum);

    /**
     * 删除选课
     * @param stuNum 学生编号
     * @param courseNum 课程编号
     * @return 影响数据条数
     */
    Integer deleteCourse(int stuNum, int courseNum);

    /**
     * 通过课程编号更新已选课程
     * @param courseNum 课程编号
     * @return 影响数据条数
     */
    Integer updateCourseSelectedMembers(int courseNum);
}
