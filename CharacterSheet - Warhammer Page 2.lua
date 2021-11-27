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

-- Improvements
-- 1. Added possibility of toggling on/off edition of character sheet input fields
-- 2. Function to be called from Page 1, to automate calculations and said toggling
require("csWarhammerPage2Data")
require("utils")

--Set this to true while editing and false when you have finished
disableSave = true
--Remember to set this to false once you are done making changes
--Then, after you save & apply it, save your game too

globalLock = false

function getWoundsTable()
    inputsTable = self.getInputs()
    woundsLabels = {"SB", "TB2", "WP", "Hd", "W"}
    local woundsObjectMap = {}
    for inputTableIndex, inputTable in ipairs(inputsTable) do
        for i, woundLabel in ipairs(woundsLabels) do
            if inputTable.label == woundLabel then
                woundsObjectMap[woundLabel] = inputTableIndex
            end
        end
    end
    return woundsObjectMap
end

function setWoundsValues(inputsTable, attributeParams, woundsObjectMap)
    local sbObjectId = inputsTable[woundsObjectMap["SB"]].index
    local tb2ObjectId = inputsTable[woundsObjectMap["TB2"]].index
    local wpObjectId = inputsTable[woundsObjectMap["WP"]].index
    local hdObjectId = inputsTable[woundsObjectMap["Hd"]].index
    local wObjectId = inputsTable[woundsObjectMap["W"]].index
    local strengthBonus = 0
    if not string.find(string.lower(attributeParams.race), "hobbit") then
        strengthBonus = math.floor(attributeParams.strength / 10)
    end
    local enduranceBonus = (math.floor(attributeParams.endurance / 10)) * 2
    local willPowerBonus = math.floor(attributeParams.will / 10)
    local hardBonus = tonumber(getNumberFromValueWithFallback(inputsTable[woundsObjectMap["Hd"]].value, "0"))
    
    local finalWounds = strengthBonus + enduranceBonus + willPowerBonus + hardBonus
    changeInputValueAndSaveToRefButtonData(sbObjectId, tostring(strengthBonus), ref_buttonData)
    changeInputValueAndSaveToRefButtonData(tb2ObjectId, tostring(enduranceBonus), ref_buttonData)
    changeInputValueAndSaveToRefButtonData(wpObjectId, tostring(willPowerBonus), ref_buttonData)
    changeInputValueAndSaveToRefButtonData(wObjectId, tostring(finalWounds), ref_buttonData)

end

function updateBasedOnFirstSheet(attributeParams)
    local woundsObjectMap = getWoundsTable()
    setWoundsValues(inputsTable, attributeParams, woundsObjectMap)
    updateSave()
end

function toggleLockCallback() 
    globalLock = toggleLock(
        globalLock, self.getInputs(), self
    )
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
    else
        ref_buttonData = defaultButtonData
    end

    createTextbox()
end


--Updates saved value for given text box
function click_textbox(i, value, selected)
    if selected == false then
        ref_buttonData.textbox[i].value = value
        updateSave()
    end
end

--Dud function for if you have a background on a counter
function click_none() end

function createTextbox()
    for i, data in ipairs(ref_buttonData.textbox) do
        --Sets up reference function
        local funcName = "textbox"..i
        local func = function(_,_,val,sel) click_textbox(i,val,sel) end
        self.setVar(funcName, func)

        self.createInput({
            input_function = funcName,
            function_owner = self,
            label          = data.label,
            alignment      = data.alignment,
            position       = data.pos,
            scale          = buttonScale,
            width          = data.width,
            height         = (data.font_size*data.rows)+24,
            font_size      = data.font_size,
            color          = buttonColor,
            font_color     = buttonFontColor,
            value          = data.value,
        })
    end
end