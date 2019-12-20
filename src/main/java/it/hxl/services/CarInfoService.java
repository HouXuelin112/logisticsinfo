package it.hxl.services;

import it.hxl.dao.CarInfoDao;
import it.hxl.po.Car;
import it.hxl.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("carInfoService")
public class CarInfoService {
    @Autowired
    private CarInfoDao carInfoDao;

    public List<Car> findAllCars(){
        Car car = new Car();
        User user = new User();
        car.setUser(user);
        return carInfoDao.findAllCars(car);
    }

    public List<Car> findCarsWithConditions(Car car){
        return carInfoDao.findAllCars(car);
    }

    public Car findCarById(int id){
        Car car = new Car();
        car.setId(id);
        User user = new User();
        car.setUser(user);
        return carInfoDao.findAllCars(car).get(0);
    }

    public List<Car> findUserCars(int id){
        User user = new User();
        user.setId(id);
        Car car = new Car();
        car.setUser(user);
        return carInfoDao.findAllCars(car);
    }

    public int deleteCarById(int id){
        return carInfoDao.deleteCarById(id);
    }

    public int updateCarById(Car car){
        return carInfoDao.updateCarById(car);
    }

    public int insertCar(Car car){
        return carInfoDao.insertCar(car);
    }
}
