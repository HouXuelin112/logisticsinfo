package it.hxl.services;

import it.hxl.dao.GoodsDao;
import it.hxl.po.Car;
import it.hxl.po.Goods;
import it.hxl.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsService")
public class GoodsService {


    @Autowired
    private GoodsDao goodsDao;

    public int insertGoods(Goods goods){
        return goodsDao.insertGoods(goods);
    }

    public List<Goods> findAllGoods(){
        Goods goods = new Goods();
        goods.setUser(new User());
        User user1 = new User();
        Car car = new Car();
        car.setUser(user1);
        goods.setCar(car);
        return goodsDao.findGoods(goods);
    }

    public List<Goods> findGoodsWithCondition(Goods goods){
        return goodsDao.findGoods(goods);
    }

    public List<Goods> findUserGoods(int user_id){
        User user = new User();
        user.setId(user_id);
        Goods goods = new Goods();
        goods.setUser(user);
        return goodsDao.findGoods(goods);
    }

    public int deleteGoodsById(int id){
        return goodsDao.deleteGoods(id);
    }

    public Goods findGoodsById(int id){
        Goods goods = new Goods();
        goods.setUser(new User());
        goods.setId(id);
        return goodsDao.findGoods(goods).get(0);
    }

    public int updateGoods(Goods goods)throws Exception{
        return goodsDao.updateGoods(goods);
    }

}
