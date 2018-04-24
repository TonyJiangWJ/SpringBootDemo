package com.tony.billing.dao.mapper;

import com.tony.billing.entity.LiabilityType;

import java.util.List;
import java.util.Map;

/**
 * @author jiangwj20966 2018/04/24
 */
public interface LiabilityTypeMapper {
    Long insert(LiabilityType liabilityType);

    LiabilityType getById(Long id);

    Integer update(LiabilityType log);

    List<LiabilityType> list(LiabilityType condition);

    List<LiabilityType> page(Map params);
}
