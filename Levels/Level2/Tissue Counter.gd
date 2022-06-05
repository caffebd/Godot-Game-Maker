extends CanvasLayer
var tissue = 0


func _ready():
	$Tissue.text = String(tissue) + "/5"

	


func _on_Tissue_tissue_collected():
	tissue = tissue + 1
	Inventory.tissues_collected = tissue
	if tissue < 3:
		get_parent().first_tissue(tissue)
	_ready()
