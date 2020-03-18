package com.yeqifu.bus.controller;

import com.yeqifu.bus.domain.Car;
import com.yeqifu.bus.service.ICarService;
import com.yeqifu.bus.vo.CarVo;
import com.yeqifu.sys.constast.SysConstast;
import com.yeqifu.sys.utils.AppFileUtils;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * 车辆管理控制器
 */
@RestController
@RequestMapping("car")
public class CarController {

    @Autowired
    private ICarService carService;

    /**
     * 加载车辆列表返回DataGridView
     * @param carVo
     * @return
     */
    @RequestMapping("loadAllCar")
    public DataGridView loadAllCar(CarVo carVo){
        return this.carService.queryAllCar(carVo);
    }

    /**
     * 添加一个车辆
     * @param carVo
     * @return
     */
    @RequestMapping("addCar")
    public ResultObj addCar(CarVo carVo){
        try{
            carVo.setCreatetime(new Date());
            //如果不是默认图片就去掉图片的_temp的后缀
            if(!carVo.getCarimg().equals(SysConstast.DEFAULT_CAR_IMG)){
                String filePath =AppFileUtils.updateFileName(carVo.getCarimg(), SysConstast.FILE_UPLOAD_TEMP);
                carVo.setCarimg(filePath);
            }
            this.carService.addCar(carVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改一个车辆
     * @param carVo
     * @return
     */
    @RequestMapping("updateCar")
    public ResultObj updateCar(CarVo carVo){
        try{
            String carimg = carVo.getCarimg();
            if (carimg.endsWith(SysConstast.FILE_UPLOAD_TEMP)) {
                String filePath =AppFileUtils.updateFileName(carVo.getCarimg(), SysConstast.FILE_UPLOAD_TEMP);
                carVo.setCarimg(filePath);
                //把原来的删除
                Car car = this.carService.queryCarByCarNumber(carVo.getCarnumber());
                AppFileUtils.removeFileByPath(car.getCarimg());

            }
            this.carService.updateCar(carVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除一个车辆
     * @param carVo
     * @return
     */
    @RequestMapping("deleteCar")
    public ResultObj deleteCar(CarVo carVo){
        try {
            this.carService.deleteCar(carVo.getCarnumber());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除车辆
     * @param carVo
     * @return
     */
    @RequestMapping("deleteBatchCar")
    public ResultObj deleteBatchCar(CarVo carVo){
        try{
            this.carService.deleteBatchCar(carVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
