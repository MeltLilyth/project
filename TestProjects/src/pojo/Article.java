package pojo;

public class Article{
    private String accountId;
    private String title;
    private String username;
    private String article;
    private String time;

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }



    @Override
    public String toString() {
        return "Article{" +
                "accountId='" + accountId + '\'' +
                ", title='" + title + '\'' +
                ", username='" + username + '\'' +
                ", article='" + article + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}
