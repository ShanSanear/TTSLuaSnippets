-- -*- coding: utf-8 -*-
--[[    Character Sheet Template    by: MrStump

You can set up your own character sheet if you follow these steps.

Step 1) Change the character sheet image
    -Right click on the character sheet, click Custom
    -Replace the image URL with one for your character sheet
    -Click import, make sure your sheet loads
    -SAVE THE GAME (the table setup)
    -LOAD FROM THAT SAVE YOU JUST MADE

Step 2) Edit script to fit your character sheet
    -Below you will see some general options, and then the big data table
    -The data table is what determines how many of which buttons are made
        -Checkboxes
        -Counters
        -Textboxes
    -By default, there are 3 of each. You can add more or remove entries
    -If you intend to add/remove, be sure only to add/remove ENTRIES
        -This is what an entry looks like:
            {
                pos   = {-0.977,0.1,-0.589},
                size  = 800,
                state = false
            },
        -Deleting the whole thing would remove that specific item on the sheet
        -Copy and pasting it after another entry would create another
    -Each entry type has unique data points (pos, size, state, etc)
        -Do not try to add in your own data points or remove them individually
        -There is a summary of what each point does at the top of its category

Step 3) Save and check script changes
    -Hit Save & Apply in the script window to save your code
    -You can edit your code as needed and Save+Apply as often as needed
    -When you are finished, make disableSave = false below then Save+apply
        -This enables saving, so your sheet will remember whats on it.

Bonus) Finding/Editing Positions for elements
    I have included a tool to get positions for buttons in {x,y,z} form
    Place it where you want the center of your element to be
    Then copy the table from the notes (lower right of screen)
        You can highlight it and CTRL+C
    Paste it into the data table where needed (pos=)
    If you want to manually tweek the values:
        {0,0,0} is the center of the character sheet
        {1,0,0} is right, {-1,0,0} is left
        {0,0,-1} is up, {0,0,1} is down
        0.1 for Y is the height off of the page.
            If it was 0, it would be down inside the model of the sheet

Begin editing below:    ]]

-- This template is as authored as above, and used for our WH campaing
-- Though I added some additional elements to it, so it would work better for our group
-- Shan

-- Improvements:
-- 1. Automated calculation of summarized / current value for all attributes and skills
-- 2. Doing above, but for the other Page of CharacterSheet - needs connecting
-- 3. Added possibility of toggling on/off edition of character sheet input fields
-- 4. Heavily reduced number of functions here - most were not used anyway

require("utils")
require("csWarhammerPage1Data")

attributeObjectMap = {}
skillsObjectMap = {}

--Set this to true while editing and false when you have finished
disableSave = false
--Remember to set this to false once you are done making changes
--Then, after you save & apply it, save your game too

otherSheetGUID = nil
globalLock = false

function doActualRefresh(inputsTable)
    attributeFinalValue = {}
    local inputsTable = self.getInputs()
    for attributeName, attributeTextInputs in pairs(attributeObjectMap) do
        local base = getNumberFromValueWithFallback(inputsTable[attributeTextInputs[1]+1].value, "0")
        local added = getNumberFromValueWithFallback(inputsTable[attributeTextInputs[2]+1].value, "0")
        local final = tonumber(base) + tonumber(added)
        changeInputValueAndSaveToRefButtonData(attributeTextInputs[3],
        tostring(final), ref_buttonData)
        attributeFinalValue[attributeName] = final
    end
    for attributeName, skills in pairs(skillsMapping) do
        local base = attributeFinalValue[attributeName]
        for i, skillName in ipairs(skills) do
            skillsTextInputs = skillsObjectMap[skillName]
            changeInputValueAndSaveToRefButtonData(skillsTextInputs[1],
            tostring(base), ref_buttonData)
            local added = getNumberFromValueWithFallback(inputsTable[skillsTextInputs[2]+1].value, "0")
            local final = base + tonumber(added)
            changeInputValueAndSaveToRefButtonData(skillsTextInputs[3],
            tostring(final), ref_buttonData)
        end
    end
    return attributeFinalValue
end

function refreshOtherSheet(attributeFinalValue)
    if otherSheetGUID == nil then
        print("Other sheet GUID is nil")
        return
    end
    local strenght = attributeFinalValue["S"]
    local endurance = attributeFinalValue["Wt"]
    local will = attributeFinalValue["SW"]
    local race = findInputByLabel(self.getInputs(), "Rasa").value
    local otherSheet = getObjectFromGUID(otherSheetGUID)
    local updateBasedOnFirstSheetParams = {strength=strenght, endurance=endurance, will=will, race=race}
    otherSheet.call("updateBasedOnFirstSheet", updateBasedOnFirstSheetParams)

end

function toggleLockCallback(playerColor) 
    -- globalLock = not globalLock
    globalLock = toggleLock(
        globalLock, self.getInputs(), self
    )
    local otherSheet = getObjectFromGUID(otherSheetGUID)
    otherSheet.call("toggleLockCallback")
end

function loadAttributeAndSkillsReferenceMaps()
    local inputsTable = self.getInputs()
    for inputTableIndex, inputTable in ipairs(inputsTable) do
        for i, attribute in ipairs(attributeNames) do
            if inputTable.label == attribute then
                if not setContains(attributeObjectMap, attribute) then
                    attributeObjectMap[attribute] = {}
                end
                attributeButtonsIndex = attributeObjectMap[attribute]
                table.insert(attributeButtonsIndex, inputTable.index)
            end
        end
        for i, skill in ipairs(skillNames) do
            if inputTable.label == skill then
                if not setContains(skillsObjectMap, skill) then
                    skillsObjectMap[skill] = {}
                end
                skillsTextIndexes = skillsObjectMap[skill]
                table.insert(skillsTextIndexes, inputTable.index)
            end
        end
    end

end

function refreshCounters(playerColor)
    attributeFinalValue = doActualRefresh(inputsTable)
    refreshOtherSheet(attributeFinalValue)
    
    updateSave()
end


function connectOtherSheet(playerColor)
    local playerObject = Player[playerColor]
    if playerObject == nil then
        print("No selection of the card")
        return
    end
    otherSheet = getOtherObjectSelectedByPlayer(self, playerObject)
    if otherSheet == nil then
        print("Other card not detected")
        return
    end
    print("Other object GUID: " .. otherSheet.getGUID())
    ref_buttonData.otherSheetGUID = otherSheet.getGUID()
    otherSheetGUID = otherSheet.getGUID()
    updateSave()
end


--Add context menu
function createContextMenu()
    self.addContextMenuItem("Od??wie?? atrybuty", refreshCounters)
    self.addContextMenuItem("Po????cz z drug?? kart??", connectOtherSheet)
    self.addContextMenuItem("Prze????cz edycj??", toggleLockCallback, undefined)
end

function createTextbox()
    for i, data in ipairs(ref_buttonData.textbox) do
        --Sets up reference function
        local funcName = "textbox"..i
        local func = function(_,_,val,sel) click_textbox(i,val,sel) end
        self.setVar(funcName, func)
        self.createInput({
            input_function = funcName,
            function_owner = self,
            label          = defaultButtonData.textbox[i].label,
            alignment      = defaultButtonData.textbox[i].alignment,
            position       = defaultButtonData.textbox[i].pos,
            scale          = buttonScale,
            width          = defaultButtonData.textbox[i].width,
            height         = (defaultButtonData.textbox[i].font_size*defaultButtonData.textbox[i].rows)+24,
            font_size      = defaultButtonData.textbox[i].font_size,
            color          = buttonColor,
            font_color     = buttonFontColor,
            value          = data.value,
        })
    end
end

--Save function
function updateSave()
    saved_data = JSON.encode(ref_buttonData)
    if disableSave==true then saved_data="" end
    self.script_state = saved_data
end

--Startup procedure
function onload(saved_data)
    if disableSave==true then saved_data="" end
    if saved_data ~= "" then
        local loaded_data = JSON.decode(saved_data)
        ref_buttonData = loaded_data
        otherSheetGUID = loaded_data.otherSheetGUID
    else
        ref_buttonData = defaultButtonData
    end

    spawnedButtonCount = 0
    createTextbox()
    createContextMenu()
    loadAttributeAndSkillsReferenceMaps()
end

--Updates saved value for given text box
function click_textbox(i, value, selected)
    if selected == false then
        ref_buttonData.textbox[i].value = value
        updateSave()
    end
end