package it.hxl.dao;

import it.hxl.po.Car;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("carInfoDao")
public interface CarInfoDao {

    /**
     * 从数据库中查询所有车辆的信息返回一个列表
     * @return
     */
    public List<Car> findAllCars(Car car);

    public int deleteCarById(@Param("id") int id);

    public int updateCarById(Car car);

    public int insertCar(Car car);

}
