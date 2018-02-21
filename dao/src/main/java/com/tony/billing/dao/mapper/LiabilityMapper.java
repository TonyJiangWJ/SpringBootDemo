package com.tony.billing.dao.mapper;

import com.tony.billing.entity.Liability;

import java.util.List;
import java.util.Map;

public interface LiabilityMapper {
    Long insert(Liability liability);

    Long update(Liability liability);

    List<Liability> page(Map params);

    List<Liability> list(Liability liability);

    Liability getById(Long id);
}