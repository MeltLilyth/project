package Mapper;

import pojo.Article;

import java.util.List;

public interface ArticleMapper {
    public List<Article>findArticleById(String accountId)throws Exception;
    public void addArticle(Article article)throws Exception;
    public Article findArticleByName(Article article)throws Exception;
}
