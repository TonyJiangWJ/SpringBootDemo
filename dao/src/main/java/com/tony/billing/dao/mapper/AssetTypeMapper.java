package com.tony.billing.dao.mapper;

import com.tony.billing.entity.AssetType;

import java.util.List;
import java.util.Map;

/**
 * @author jiangwj20966 2018/04/24
 */
public interface AssetTypeMapper {
    Long insert(AssetType assetType);

    AssetType getById(Long id);

    Integer update(AssetType log);

    List<AssetType> list(AssetType condition);

    List<AssetType> page(Map params);
}
