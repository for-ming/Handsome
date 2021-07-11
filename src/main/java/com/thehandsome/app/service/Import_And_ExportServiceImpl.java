package com.thehandsome.app.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.Import_And_ExportDAO;
import com.thehandsome.app.dto.Import_And_ExportDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class Import_And_ExportServiceImpl implements Import_And_ExportService {
	@Autowired
	private Import_And_ExportDAO import_And_ExportDAO;
	
	@Override
	public void insertImport_And_Export(Import_And_ExportDTO import_And_ExportDTO) throws SQLException {
		try {
			import_And_ExportDAO.insertImport_And_Export(import_And_ExportDTO);
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		}
	}
}
