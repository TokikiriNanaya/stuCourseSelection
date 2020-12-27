package com.kiriya.service;

import com.kiriya.dao.StudentDao;
import com.kiriya.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.HashMap;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDao studentDao;

    @Override
    public Student getStuById(int num) {
        return studentDao.getStuById(num);
    }

    @Override
    public List<HashMap> getAllCourse() {
        return studentDao.getAllCourse();
    }

    @Override
    public List<HashMap> getMyMsg(int num) {
        return null;
    }

    @Override
    public List<HashMap> getMyCourse(int num) {
        return studentDao.getMyCourse(num);
    }

    @Override
    public Integer selectCourse(int stuNum, int courseNum) {
        return studentDao.selectCourse(stuNum, courseNum);
    }

    @Override
    public Boolean ifSelected(int stuNum, int courseNum) {
        return studentDao.ifSelected(stuNum, courseNum) == 1;
    }

    @Override
    public Integer deleteCourse(int stuNum, int courseNum) {
        return studentDao.deleteCourse(stuNum, courseNum);
    }
}
