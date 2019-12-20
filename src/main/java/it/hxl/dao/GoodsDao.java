package it.hxl.dao;

import it.hxl.po.Goods;

import java.util.List;

public interface GoodsDao {

    public List<Goods> findGoods(Goods goods);

    public int deleteGoods(int id);

    public int updateGoods(Goods goods)throws Exception;

    public int insertGoods(Goods goods);

}
