package com.mapper;

import java.util.List;

import com.model.ProModel;


public interface ProMapper {
    int insert(ProModel t);

    int delete(Object id);

    int deleteModel(ProModel t);

    int update(ProModel t);

    int updateActive(ProModel t);

    ProModel selectId(Object id);

    List<ProModel> selectAll(ProModel t);

    List<ProModel> selectModel(ProModel t);

    int selectCount(ProModel t);
}