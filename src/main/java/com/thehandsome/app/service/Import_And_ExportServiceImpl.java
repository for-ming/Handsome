package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.Import_And_ExportDAO;
import com.thehandsome.app.dto.Import_And_ExportDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class Import_And_ExportServiceImpl implements Import_And_ExportService {
	@Autowired
	Import_And_ExportDAO import_and_exportDAO;
	
	@Override
	public Import_And_ExportDTO getState(int id) throws SQLException {
		return import_and_exportDAO.getState(id);
	}
	
	@Override
	public List<Import_And_ExportDTO> getStateList(int id) throws SQLException {
		return import_and_exportDAO.getStateList(id);
	}

	@Override
	public List<Import_And_ExportDTO> getStateWithOrder(int id, String order) throws SQLException {
		return import_and_exportDAO.getStateWithOrder(id, order);
	}

	@Override
	public void updateDest(int id, int destination) throws SQLException {
		import_and_exportDAO.updateDest(id, destination);
	}

	@Override
	public void updateStockState(int id, String order) throws SQLException {
		import_and_exportDAO.updateStockState(id, order);
	}

	@Override
	public Import_And_ExportDTO getInfo(int id) throws SQLException {
		return import_and_exportDAO.getInfo(id);
	}
	
	@Override
	public void insertImport_And_Export(Import_And_ExportDTO import_And_ExportDTO) throws SQLException {
		try {
			import_and_exportDAO.insertImport_And_Export(import_And_ExportDTO);
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		}
	}
}
