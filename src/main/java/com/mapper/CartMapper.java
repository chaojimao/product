package com.mapper;

import java.util.List;

import com.model.CartModel;


public interface CartMapper {
    int insert(CartModel t);

    int delete(Object id);

    int deleteModel(CartModel t);

    int update(CartModel t);

    int update2(CartModel t);

    CartModel selectId(Object id);

    List<CartModel> selectAll(CartModel t);

    List<CartModel> selectModel(CartModel t);

    int selectCount(CartModel t);
}