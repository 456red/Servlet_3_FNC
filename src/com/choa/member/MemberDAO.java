package com.choa.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class MemberDAO {
	//selectOne
	public MemberDTO selectOne(MemberDTO memberDTO) throws Exception {
		MemberDTO mDto = null;
		Connection con = DBConnector.getConnect();
		String sql ="select * from member where id=? and pw=? and job=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getJob());
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			mDto = new MemberDTO();
			mDto.setId(rs.getString("id"));
			mDto.setName(rs.getString("name"));
			mDto.setEmail(rs.getString("email"));
			mDto.setPhone(rs.getString("phone"));
			mDto.setAge(rs.getInt("age"));
			mDto.setJob(rs.getString("job"));
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return mDto;
		
	}
	
	//idCheck
	public boolean idCheck(String id) throws Exception {
		boolean check=true;
		Connection con = DBConnector.getConnect();
		String sql ="select * from member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			check=false;
		}
		DBConnector.disConnect(rs, st, con);
		return check;
	}
	
	//insert
	public int insert(MemberDTO memberDTO)throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="insert into member values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		st.setInt(6, memberDTO.getAge());
		st.setString(7, memberDTO.getJob());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
				
		
	}
	
	//getCount
	public int getTotalCount() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(id), 0) from member";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		
		return result;
	}
	
	
	//selectList
	public ArrayList<MemberDTO> selectList(int startRow, int lastRow) throws Exception{
		
		Connection con = DBConnector.getConnect();
		
		String sql ="select * from "
				+ "(select rownum R, M.* from "
				+ "(select * from member order by id asc) M) "
				+ "where R between ? and ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, startRow);
		st.setInt(2, lastRow);
		
		ResultSet rs = st.executeQuery();
		ArrayList<MemberDTO> ar = new ArrayList<>();
		
		while(rs.next()) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setAge(rs.getInt("age"));
			memberDTO.setJob(rs.getString("job"));
			ar.add(memberDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	//======================
	
	

}
