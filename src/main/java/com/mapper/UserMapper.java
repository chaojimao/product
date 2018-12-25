package com.mapper;

import java.util.List;

import com.model.UserModel;


public interface UserMapper {
    int insert(UserModel t);

    int delete(Object id);

    int deleteModel(UserModel t);

    int update(UserModel t);

    int updateActive(UserModel t);

    UserModel selectId(Object id);

    List<UserModel> selectAll(UserModel t);

    List<UserModel> selectModel(UserModel t);

    int selectCount(UserModel t);
}
