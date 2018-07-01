package service;

import pojo.Img;

public interface ImgService {
    public Img queryImg(String accountId)throws Exception;
    public void insertImg(Img img)throws Exception;
    public void updateImg(Img img)throws Exception;
}
