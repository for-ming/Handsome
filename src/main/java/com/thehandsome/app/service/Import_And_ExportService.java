package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.Import_And_ExportDTO;

public interface Import_And_ExportService {
	Import_And_ExportDTO getState(@Param("id") int id) throws SQLException;
	List<Import_And_ExportDTO> getStateList(@Param("id") int id) throws SQLException;
	List<Import_And_ExportDTO> getStateWithOrder(@Param("id") int id, @Param("order") String order) throws SQLException;
	void insertImport_And_Export(Import_And_ExportDTO import_And_ExportDTO) throws SQLException;
	void updateDest(@Param("id") int id, @Param("destination") int destination) throws SQLException;
	void updateStockState(@Param("id") int id, @Param("order") String order) throws SQLException;
	Import_And_ExportDTO getInfo(@Param("id") int id) throws SQLException;
}
