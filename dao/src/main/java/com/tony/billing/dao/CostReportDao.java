package com.tony.billing.dao;

import com.tony.billing.entity.query.ReportEntityQuery;

/**
 * Author by TonyJiang on 2017/6/10.
 */
public interface CostReportDao {

    Long getReportAmountByCondition(ReportEntityQuery query);
}