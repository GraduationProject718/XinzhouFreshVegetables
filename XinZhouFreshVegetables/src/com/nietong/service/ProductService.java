package com.nietong.service;

import java.util.List;

import com.nietong.domain.Notice;
import com.nietong.domain.PageModel;
import com.nietong.domain.Product;

public interface ProductService {

	List<Product> findHots() throws Exception;

	List<Product> findNews() throws Exception;

	Product findProductByPid(String pid) throws Exception;

	PageModel findProductsByCidWithPage(String cid, int curNum) throws Exception;

	PageModel findAllProductsWithPage(int curNum) throws Exception;

	void saveProduct(Product product) throws Exception;

	void pushUp(String pid) throws Exception;

	void pushDown(String pid)throws Exception;

	PageModel findAllProductsWithPushdown(int curNum) throws Exception;

	void editProduct(Product product) throws Exception;

	PageModel searchProduct(String searchInfo, int curNum) throws Exception;

	List<Product> findTop() throws Exception;

}
