package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.eoot.eootprj.model.VilPost;

public interface VilPostDao {
   public VilPost getVilPost(String code);
   
   public List<VilPost> getVilPosts(String query, String field);

   @Select("SELECT TOP 1 * FROM VilPosts "
         + "WHERE REGDATE &gt; (SELECT REGDATE FROM VilPosts "
         + "WHERE CODE = #{code})ORDER BY REGDATE ASC")
   
   public int update(VilPost vilPost);

   @Delete("DELETE FROM VilPosts WHERE CODE = #{code}")
   public int delete(VilPost vilPost);

   @SelectKey(before = true
         , keyColumn = "code"
         , statement = "SELECT ISNULL(MAX(CAST(CODE AS INT)),0)+1 CODE FROM VilPosts"
         , resultType = java.lang.String.class
         , keyProperty = "String")
   @Insert("INSERT INTO VilPosts(CODE,SORT,TITLE,CONTENT,WRITER,REGDATE,HIT,LIKECNT,CLIPCNT,COMMENTCNT) "
         + "VALUES(code,#{sort},#{title},#{content},#{writer},getDate(),0,0,0,0)")
   public int insert(VilPost vilPost);
}