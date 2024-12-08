
class_name ElectricBuilding

class ElectricBuildingClass extends Building.BuildingClass:
	func init_part_class(settings: Dictionary) -> BuildingPart.BuildingPartClass:
		if settings.is_empty():
			return null
		var type: int = settings["type"]
		var atlas_coord_value: Vector2i = settings["atlas"]
		if type == BuildingPart.Type.Enterance:
			return ResearchEnterancePart.new(atlas_coord_value)
		if type == BuildingPart.Type.Path:
			return ResearchPathPart.new(atlas_coord_value)
		if type == BuildingPart.Type.PowerTower:
			return PowerTowerPart.new(atlas_coord_value)
		return null
