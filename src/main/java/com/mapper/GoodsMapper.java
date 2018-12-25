package com.mapper;

import java.util.List;

import com.model.GoodsModel;


public interface GoodsMapper {
    int insert(GoodsModel t);

    int delete(Object id);

    int deleteModel(GoodsModel t);

    int update(GoodsModel t);

    int updateActive(GoodsModel t);

    GoodsModel selectId(Object id);

    List<GoodsModel> selectAll(GoodsModel t);

    List<GoodsModel> selectModel(GoodsModel t);

    int selectCount(GoodsModel t);
}