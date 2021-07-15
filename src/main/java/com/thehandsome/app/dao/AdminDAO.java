package com.thehandsome.app.dao;

import java.sql.SQLException;

import com.thehandsome.app.dto.AdminDTO;



public interface AdminDAO {

	AdminDTO selectMemberByIdPassword(AdminDTO adminDTO) throws SQLException;
}
