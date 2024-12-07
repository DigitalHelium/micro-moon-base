class_name Matrix

class MatrixClass extends Node:
	var mat: Array = []
	var rows: int
	var columns: int
	
	func _init(rows: int, columns: int):
		self.rows = rows
		self.columns = columns
		init_matrix()
		
	
	func init_matrix() -> void:
		for i in rows:
			mat.append([])
			mat[i] = []
			for j in columns:
				mat[i].append([])
				mat[i][j] = -1
	
	func set_value(row: int, column: int, value: int) -> void:
		mat[row][column] = value
		pass
		
	func get_value(row: int, column: int) -> int:
		if row >= 0 and row < rows and column >= 0 and column < columns:
			return mat[row][column]
		return -1
		
	func get_rows() -> int:
		return rows
		
	func get_columns() -> int:
		return columns
	
