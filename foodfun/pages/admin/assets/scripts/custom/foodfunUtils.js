function oTable_refresh(oTable){
	var start = oTable.fnSettings()._iDisplayStart;
	var length = oTable.fnSettings()._iDisplayLength;
	return start/length;
}
