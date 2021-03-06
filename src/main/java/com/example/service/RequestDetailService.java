package com.example.service;

import java.util.ArrayList;

import org.springframework.data.repository.query.Param;

import com.example.model.RequestDetail;

public interface RequestDetailService {

	ArrayList<RequestDetail> findReqDetailByReqId(Integer reqId);

	void fillReceiveQuantity(RequestDetail requestDetail);

	void deleteRqDetail(RequestDetail rqDetail);

	void saveReqDetl(RequestDetail newReqDetl);

	void updateReqQtyByReqdeId(Integer rdId, Integer reqQty);

}
