extends Resource
class_name Unit

@export var unit_number:int = 0
@export var data_id: int = 0
@export var name: String = ""

@export var element: String = ""
@export var gender: String = ""
@export var rarity: int = 1
@export var cost = 1
@export var arena_type: int = 0
@export var level: int = 0
@export var max_level:int = 0

@export var HP: int = 0
@export var ATK: int = 0
@export var DEF: int = 0
@export var REC: int = 0

@export var skills: Array[Resource] = []

@export var thumbnail: Texture2D = null
@export var battle_thumbnail: Texture2D = null
@export var full_sprite: Texture2D = null
@export var sprite_sheet: SpriteFrames = null

@export var quotes: Resource = null
@export var unit_lore: String = ""
