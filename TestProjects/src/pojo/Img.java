package pojo;

public class Img {
    private String accountId;
    private String img;

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Img{" +
                "accountId='" + accountId + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
