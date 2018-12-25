package com.mapper;

import java.util.List;

import com.model.AdminModel;


public interface AdminMapper {
    int insert(AdminModel t);

    int delete(Object id);

    int deleteModel(AdminModel t);

    int update(AdminModel t);

    int updateActive(AdminModel t);

    AdminModel selectId(Object id);

    List<AdminModel> selectAll(AdminModel t);

    List<AdminModel> selectModel(AdminModel t);

    int selectCount(AdminModel t);
}