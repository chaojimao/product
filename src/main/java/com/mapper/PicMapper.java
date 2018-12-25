package com.mapper;

import java.util.List;

import com.model.PicModel;




public interface PicMapper {
    int insert(PicModel t);

    int delete(Object id);

    int deleteModel(PicModel t);

    int update(PicModel t);

    int update2(PicModel t);

    PicModel selectId(Object id);

    List<PicModel> selectAll(PicModel t);

    List<PicModel> selectModel(PicModel t);

    int selectCount(PicModel t);
}