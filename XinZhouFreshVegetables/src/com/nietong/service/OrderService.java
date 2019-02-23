package com.nietong.service;

import com.nietong.domain.Order;
import com.nietong.domain.PageModel;
import com.nietong.domain.User;

public interface OrderService {

	void saveOrder(Order order) throws Exception;

	PageModel findMyOrdersWithPage(User user, int curNum) throws Exception;

	Order findOrderByOid(String oid) throws Exception;

}
