package com.mapper;

import java.util.List;

import com.model.DesModel;


public interface DesMapper {
    int insert(DesModel t);

    int delete(Object id);

    int deleteModel(DesModel t);

    int update(DesModel t);

    int updateActive(DesModel t);

    DesModel selectId(Object id);

    List<DesModel> selectAll(DesModel t);

    List<DesModel> selectModel(DesModel t);

    int selectCount(DesModel t);
}