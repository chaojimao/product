package com.mapper;

import java.util.List;

import com.model.DictModel;


public interface DictMapper {
    int insert(DictModel t);

    int delete(Object id);

    int deleteModel(DictModel t);

    int update(DictModel t);

    int updateActive(DictModel t);

    DictModel selectId(Object id);

    List<DictModel> selectAll(DictModel t);

    List<DictModel> selectModel(DictModel t);

    int selectCount(DictModel t);
}