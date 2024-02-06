--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--

documentInspected = false;
idCard = false;
check = false;
glock = false;
attack = false;
--start
function story(aName)
	if(aName == "start") then
		playMusic("background.wav")
		createTextfield("You wake up, a white bright light making your eyes hurt . you feel dizzy and disoriented")
		createButton("wakeUp", "Open your eyes")
	end

--first room
	if(aName == "wakeUp") then
		CLS()
		setBackground("katinka.JPG")
		createTextfield("you look around. you lay on what looks like a patient bed, with all sorts of surgical tools on the stand besides you.")

		createButton("room", "go through the door")
	end

--hallway room
	if(aName == "room") then
		CLS()
		setBackground("tanja.JPG")
		createTextfield("as you enter the door, you are met with two hallway, dimly lit. what is this place and why are you here? you need to figure out why")

		createButton("hallway1", "left hallway")
		createButton("hallway2", "right hallway")
		createButton("inspect", "inspect blood")
		if(aName == "inspect") then
			CLS();
			createTextfield("there is a large puddle of blood in the middle of the room, smeared across the floor. you notice... teeth and feathers?")
			createButton("room", "go back")
		end
	end

--hallway 1
	if(aName == "hallway1") then
		CLS()
		createTextfield("you enter the hallway, the light flickering. there are scratch marks all over the walls, and a closet containing documents that has been pushed over.")
		createButton("room", "go back")

		if(documentInspected == false) then
			createButton("inspectDocument", "inspect document")
		end

		if(aName == "inspectDocument") then
			createTextfield("'placeholder'")
			documentInspected = true;
			createButton("hallway1", "stop inspecting")
		end	
	end

--hallway2
	if(aName == "hallway2") then
		CLS()
		createTextfield("you see an office, the door pulled off of its hinges, and a metal door")
		
		createButton("office", "get into the office")

		--secure door
		if(check = true)
		createButton("secureDoor", "go through door")
		end

		if(idCard = true)then
			createTextfield("you used the card")
			check = true;
		else
			createTextfield("you need the id card to open the door")
			check = false;
		end
	end

	--[[secure door
	if(aName == "secureDoor") then
		createTextfield("you walk through the door. you quickly understand why it was locked as you are eye to eye with a monsterous creature")
		createButton("run1", "flee")

		if(glock == true) then
			createButton("gun2", "use gun")
		end

		if(aName == "run1") then
			createTextfield("you try to flee but the creature slices you with its claw. you are stunned and hurt")
			attack = true;
		end
		if(attack == true) then
			createButton("secureDoor", "try to run away again")
		end
	end
	]]--

	--office
	if(aName == "office") then
	CLS();
		createTextfield("you enter the office.")

		createButton("desk", "look in desk")
		createButton("closet", "look in closet")

		if(aName == "desk") then
			createTextfield("you open the drawer")
			createButton("document2", "more documents")
			createButton("idCard", "grab id card")

			if(aName == "document2") then
				createTextfield("")
			end
		end

		if(aName == "closet") then
			CLS();
			createTextfield("there is nothing but clothes here, and a oddly suspicious back panel")
			createButton("backPanel", "remove back panel")

			--back panel
			if(aName == "backPanel") then
				createTextfield("resources")
				createButton("idCard", "grab id card")
				createButton("grabGun", "grab gun")

				if(aName == "grabGun") then
					glock = true;
				end

				if(aName == "idCard") then
					idCard = true;
				end
			end
			--
		end
	end

	if(aName == "exit") then
		exitGame();
	end
end

