extends Resource
class_name Zone

@export_category("General")
@export var id: int = 0
@export var name: String = ""
@export var description: String = ""
@export var stages: int = 2
@export var energy: int = 5
@export var Stage: Array[Stage] = []
@export var is_visible: bool = false

@export_category("Assets")
@export var BG: CompressedTexture2D
@export var music: AudioStreamMP3
@export var boss_music = AudioStreamMP3

@export_category("Risk / Reward")
@export var difficulty: int = 1
@export var xp: float = 1.0
@export var karma: int = 1
@export var zel: int = 1

@export_category("Cutscenes")
@export var beginning_cutscene: Dialogue
@export var ending_cutscene: Dialogue
