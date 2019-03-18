package com.tony.billing.dao.mapper;

import com.tony.billing.dao.mapper.base.AbstractMapper;
import com.tony.billing.entity.CostRecord;
import com.tony.billing.entity.query.CostRecordQuery;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author by TonyJiang on 2017/7/12.
 */
@Repository
public interface CostRecordMapper extends AbstractMapper<CostRecord> {

    List<CostRecord> page(Map<String, Object> params);

    Integer count(Map<String, Object> params);

    CostRecord findByTradeNo(Map<String, Object> params);

    Integer toggleDeleteStatus(Map<String, Object> params);

    Integer toggleHideStatus(Map<String, Object> params);

    Integer updateByTradeNo(CostRecord record);

}
