package com.market.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.market.vo.CategoryVO;
import com.market.vo.Paging;
import com.market.vo.ProductsVO;
import com.market.vo.ReplyVO;

@Repository
public class MainDAOImpl implements MainDAO{
	
	@Inject
	private SqlSession sql;
	
	//follow an instruction from mainMapper, get data from DB, check comments on ServiceImpl
	private static String namespace = "com.market.mappers.mainMapper";
	
	@Override
	public List<CategoryVO> category() throws Exception{
		return sql.selectList(namespace + ".category");
	}
	
	@Override
	public List<CategoryVO> list(Paging p) throws Exception {
		return sql.selectList(namespace + ".paging", p);
	}
	
	@Override
	public List<CategoryVO> Toylist(Paging p) throws Exception{
		return sql.selectList(namespace + ".ToyPaging",p);
	}
	@Override
	public List<CategoryVO> Clothlist(Paging p) throws Exception{
		return sql.selectList(namespace + ".ClothPaging",p);
	}
	@Override
	public List<CategoryVO> Fruitlist(Paging p) throws Exception{
		return sql.selectList(namespace + ".FruitPaging",p);
	}
	@Override
	public List<CategoryVO> Electroniclist(Paging p) throws Exception{
		return sql.selectList(namespace + ".ElectronicPaging",p);
	}
	@Override
	public List<CategoryVO> Shoelist(Paging p) throws Exception{
		return sql.selectList(namespace + ".ShoePaging",p);
	}
	// count the number of products
	@Override
	public int listCount() throws Exception {
		return sql.selectOne(namespace + ".listCount");
	}
	
	@Override
	public int ToyCount() throws Exception{
		return sql.selectOne(namespace + ".ToyCount");
	}
	@Override
	public int ClothCount() throws Exception{
		return sql.selectOne(namespace + ".ClothCount");
	}
	@Override
	public int FruitCount() throws Exception{
		return sql.selectOne(namespace + ".FruitCount");
	}
	@Override
	public int ElectronicCount() throws Exception{
		return sql.selectOne(namespace + ".ElectronicCount");
	}
	@Override
	public int ShoeCount() throws Exception{
		return sql.selectOne(namespace + ".ShoeCount");
	}
	@Override
	public int ReplyCount(int product_num) throws Exception{
		return sql.selectOne(namespace + ".ReplyCount",product_num);
	}
	
	@Override
	public void write(ProductsVO vo) throws Exception{
		sql.insert(namespace + ".write",vo);
	}
	
	@Override
	public List<ProductsVO> showProducts() throws Exception{
		return sql.selectList(namespace + ".view");
	}
	
	@Override
	public ProductsVO productDetail(int product_num) throws Exception{
		return sql.selectOne(namespace + ".detail",product_num);
	}
	
	@Override
	public void productModify(ProductsVO vo) throws Exception{
		sql.update(namespace + ".modify",vo);
	}
	
	@Override
	public void productDelete(int product_num) throws Exception{
		sql.delete(namespace + ".delete",product_num);
	}
	
	@Override
	public void reply(ReplyVO vo) throws Exception{
		sql.insert(namespace + ".reply",vo);
	}
	
	@Override
	public void replyDelete(int reply_num) throws Exception{
		sql.delete(namespace + ".replyDelete",reply_num);
	}
	
	@Override
	public List<ReplyVO> showReplies(int product_num) throws Exception{
		return sql.selectList(namespace + ".replyList", product_num);
	}
	
	@Override
	public void replyModify(ReplyVO vo) throws Exception{
		sql.update(namespace + ".replyModify", vo);
	}
	
	@Override
	public void hit(int product_num) throws Exception{
		sql.update(namespace + ".hit", product_num);
	}
	
}