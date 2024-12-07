
class_name ResearchBuilding

class ResearchBuildingClass extends Building.BuildingClass:
	func init_part_class(type: int) -> BuildingPart.BuildingPartClass:
		if type == BuildingPart.Type.Enterance:
			return EnterancePart.EnterancePartClass.new()
		if type == BuildingPart.Type.Path:
			return PathPart.PathPartClass.new()
		if type == BuildingPart.Type.Research:
			return ResearchPart.ResearchPartClass.new()
		return null
