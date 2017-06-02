package com.tony.dao;

import com.tony.entity.CostRecord;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author jiangwj20966 on 2017/6/2.
 */
@Repository
public interface CostRecordDao {
    List<CostRecord> find(CostRecord record);
}
