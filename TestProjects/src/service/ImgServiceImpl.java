package service;

import Mapper.ImgMapper;
import org.springframework.beans.factory.annotation.Autowired;
import pojo.Img;

public class ImgServiceImpl implements ImgService{
    @Autowired(required = false)
    private ImgMapper imgMapper;
    @Override
    public Img queryImg(String accountId) throws Exception {
        return imgMapper.findImgById(accountId);
    }

    @Override
    public void insertImg(Img img) throws Exception {
        imgMapper.addImg(img);
    }

    @Override
    public void updateImg(Img img) throws Exception {
        imgMapper.updateImg(img);
    }
}
