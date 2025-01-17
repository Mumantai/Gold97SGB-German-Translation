	object_const_def ; object_event constants
	const PAGOTAPOKEMONACADEMY_TEACHER
	const PAGOTAPOKEMONACADEMY_YOUNGSTER
	const PAGOTAPOKEMONACADEMY_YOUNGSTER1
	const PAGOTAPOKEMONACADEMY_GAMEBOY_KID1
	const PAGOTAPOKEMONACADEMY_GAMEBOY_KID2
	const PAGOTAPOKEMONACADEMY_YOUNGSTER2
	const PAGOTAPOKEMONACADEMY_POKEDEX

PagotaPokemonAcademy_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcademyTeacher:
	faceplayer
	opentext
	writetext AcademyTeacherIntroText
	yesorno
	iffalse .Part1
	writetext AcademyTeacherTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyTeacherTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyTeacherTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyTeacherNoMoreToTeachText
	waitbutton
	closetext
	end

PagotaPokemonAcademyYoungster1Script:
	jumptextfaceplayer PagotaPokemonAcademyYoungster1Text

PagotaPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext PagotaPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject PAGOTAPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

PagotaPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext PagotaPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject PAGOTAPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

PagotaPokemonAcademyYoungster2Script:
	jumptextfaceplayer PagotaPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	jump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	jump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	jump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	jump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	jump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine:
; unused
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd DifficultBookshelfScript

AcademyTeacherSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end
	
AcademyGBChecker:
	faceplayer
	opentext
	writetext GBText1
	waitbutton
	special GameboyCheck
	ifnotequal GBCHECK_CGB, .NotGBCCheck
	writetext GBText2
	waitbutton
	closetext
	end
	
.NotGBCCheck
	special GameboyCheck
	ifnotequal GBCHECK_SGB, .NotSGBCheck
	writetext GBText4
	waitbutton
	closetext
	end

.NotSGBCheck	
	writetext GBText3
	waitbutton
	closetext
	end

GBText1:
	text "I read today that"
	line "if you're playing"
	cont "on Game Boy Color,"
	para "there's a setting"
	line "you can change in"
	para "the OPTION menu"
	line "that alters the"
	para "colors used in the"
	line "game."
	done
	
GBText2:
	text "Looks like you are"
	line "currently using a"
	cont "Game Boy Color!"
	para "Give that setting"
	line "a try!"
	done
	
GBText3:
	text "Looks like you're"
	line "using an original"
	cont "Game Boy today."
	para "No colors here!"
	done	

GBText4:
	text "Looks like you're"
	line "using a Super Game"
	cont "Boy today!"
	para "Wow! I'm on TV!"
	done

AcademyTeacherIntroText:
	text "Hello!"

	para "Welcome to the"
	line "PAGOTA CITY"
	cont "trainer's school."
	
	para "Want to learn"
	line "how battles work?"
	done

AcademyTeacherTeachHowToWinText:
	text "In battle, the"
	line "#MON at the top"
	para "of the list is"
	line "sent out first!"

	para "It's a good"
	line "strategy to put"
	para "some thought into"
	line "which #MON you"
	cont "keep at the top."

	para "Wanna learn more?"
	done

AcademyTeacherTeachMoreText:
	text "Do you want to"
	line "know how to raise"
	cont "#MON well?"
	done

AcademyTeacherTeachHowToRaiseWellText:
	text "If #MON come"
	line "out in battle even"

	para "briefly, it will"
	line "get EXP. Points."

	para "You can send out"
	line "a weak #MON"
	para "into battle, then"
	line "immediately switch"
	para "it out for a"
	line "stronger #MON."
	para "This way, it still"
	line "can gain EXP."
	done

AcademyTeacherNoMoreToTeachText:
	text "You must already"
	line "be an expert on"
	cont "#MON!"
	done

PagotaPokemonAcademyYoungster1Text:
	text "I'm taking notes"
	line "of the teacher's"
	cont "lecture."

	para "I'd better copy"
	line "the stuff on the"
	cont "chalkboard too."
	done

PagotaPokemonAcademyGameboyKid1Text:
	text "I traded my best"
	line "#MON to the"
	cont "guy beside me."
	done

PagotaPokemonAcademyGameboyKid2Text:
	text "A #MON you get"
	line "in a trade grows"
	cont "quickly."

	para "But if you don't"
	line "have the right GYM"

	para "BADGE, they may"
	line "disobey you."
	done

PagotaPokemonAcademyYoungster2Text:
	text "A #MON holding"
	line "a BERRY will heal"
	cont "itself in battle."

	para "Many other items"
	line "can be held by"
	cont "#MON…"

	para "It sure is tough"
	line "taking notes…"
	done

AcademyBlackboardText:
	text "The blackboard"
	line "describes #MON"

	para "status changes in"
	line "battle."
	done

AcademyBlackboardText2:
; unused
	text "Read which topic?"
	done

AcademyPoisonText:
	text "If poisoned, a"
	line "#MON steadily"
	cont "loses HP."

	para "Poison lingers"
	line "after the battle,"

	para "and HP is lost as"
	line "you walk."

	para "To cure it, use an"
	line "ANTIDOTE."
	done

AcademyParalysisText:
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a PARLYZ HEAL."
	done

AcademySleepText:
	text "If asleep, your"
	line "#MON can't make"
	cont "a move."

	para "A sleeping #MON"
	line "doesn't wake up"
	cont "after battle."

	para "Wake it up with"
	line "an AWAKENING."
	done

AcademyBurnText:
	text "A burn steadily"
	line "consumes HP."

	para "It also reduces"
	line "attack power."

	para "A burn lingers"
	line "after battle."

	para "Use a BURN HEAL as"
	line "the cure."
	done

AcademyFreezeText:
	text "If your #MON is"
	line "frozen, it can't"
	cont "do a thing."

	para "It remains frozen"
	line "after battle."

	para "Thaw it out with"
	line "an ICE HEAL."
	done

AcademyNotebookText:
	text "It's this kid's"
	line "notebook…"

	para "Catch #MON"
	line "using # BALLS."

	para "Up to six can be"
	line "in your party."

	para "Keep reading?"
	done

AcademyNotebookText1:
	text "Before throwing a"
	line "# BALL, weaken"
	cont "the target first."

	para "A poisoned or"
	line "burned #MON is"
	cont "easier to catch."

	para "Keep reading?"
	done

AcademyNotebookText2:
	text "Some moves may"
	line "cause confusion."

	para "Confusion may make"
	line "a #MON attack"
	cont "itself."

	para "Leaving battle"
	line "clears up any"
	cont "confusion."

	para "Keep reading?"
	done

AcademyNotebookText3:
	text "People who catch"
	line "and use #MON"

	para "in battle are"
	line "#MON trainers."

	para "They are expected"
	line "to visit #MON"

	para "GYMS and defeat"
	line "other trainers."

	para "The next page"
	line "is… Blank!"

	para "Girl: Looks like"
	line "that's all I"
	cont "wrote!"
	done

AcademyStickerMachineText:
	text "This super machine"
	line "prints data out as"

	para "stickers!"
	done

PagotaPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, PAGOTA_CITY, 6
	warp_event  4, 15, PAGOTA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	db 7 ; object events
	object_event  4,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AcademyTeacher, -1
	object_event  0,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AcademyGBChecker, -1
	object_event  2,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
