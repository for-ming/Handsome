package com.thehandsome.app.service;

import java.sql.SQLException;

import com.thehandsome.app.dto.Import_And_ExportDTO;

public interface Import_And_ExportService {
	void insertImport_And_Export(Import_And_ExportDTO import_And_ExportDTO) throws SQLException;
}
