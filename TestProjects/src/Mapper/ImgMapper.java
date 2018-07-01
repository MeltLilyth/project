package Mapper;

import pojo.Img;

public interface ImgMapper {
    public Img findImgById(String accountId)throws Exception;
    public void addImg(Img img)throws Exception;
    public void updateImg(Img img)throws Exception;
}
