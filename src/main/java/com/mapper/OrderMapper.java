package com.mapper;

import java.util.List;

import com.model.OrderModel;


public interface OrderMapper {
    int insert(OrderModel t);

    int delete(Object id);

    int deleteModel(OrderModel t);

    int update(OrderModel t);

    int updateActive(OrderModel t);

    OrderModel selectId(Object id);

    List<OrderModel> selectAll(OrderModel t);

    List<OrderModel> selectModel(OrderModel t);

    int selectCount(OrderModel t);
}