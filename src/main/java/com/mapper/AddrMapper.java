package com.mapper;

import java.util.List;

import com.model.AddrModel;


public interface AddrMapper {
    int insert(AddrModel t);

    int delete(Object id);

    int deleteModel(AddrModel t);

    int update(AddrModel t);

    int updateActive(AddrModel t);

    AddrModel selectId(Object id);

    List<AddrModel> selectAll(AddrModel t);

    List<AddrModel> selectModel(AddrModel t);

    int selectCount(AddrModel t);
}