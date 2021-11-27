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

require("utils")

--Set this to true while editing and false when you have finished
disableSave = false
--Remember to set this to false once you are done making changes
--Then, after you save & apply it, save your game too

--Color information for button text (r,g,b, values of 0-1)
buttonFontColor = {0,0,0}
--Color information for button background
buttonColor = {1,1,1}
--Change scale of button (Avoid changing if possible)
buttonScale = {0.1,0.1,0.1}

globalLock = false

--This is the button placement information
defaultButtonData = {
    --Add checkboxes
    checkbox = {
        --[[
        pos   = the position (pasted from the helper tool)
        size  = height/width/font_size for checkbox
        state = default starting value for checkbox (true=checked, false=not)
        ]]
        --First checkbox
        {
            pos   = {-0.977,0.1,1.589},
            size  = 800,
            state = false
        },
        --Second checkbox
        {
            pos   = {-0.163,0.1,1.594},
            size  = 800,
            state = false
        },
        --Third checkbox
        {
            pos   = {0.735,0.1,1.592},
            size  = 800,
            state = false
        },
        --End of checkboxes
    },
    --Add counters that have a + and - button
    counter = {
        --[[
        pos    = the position (pasted from the helper tool)
        size   = height/width/font_size for counter
        value  = default starting value for counter
        hideBG = if background of counter is hidden (true=hidden, false=not)
        ]]
        --First counter
        {
            pos    = {-1.111,0.1,1.044},
            size   = 800,
            value  = 0,
            hideBG = true
        },
        --Second counter
        {
            pos    = {-0.151,0.1,1.043},
            size   = 800,
            value  = 0,
            hideBG = false
        },
        --Third counter
        {
            pos    = {0.736,0.1,1.051},
            size   = 800,
            value  = 0,
            hideBG = true
        },
        --End of counters
    },
    --Add editable text boxes
    textbox = {
        --[[
        pos       = the position (pasted from the helper tool)
        rows      = how many lines of text you want for this box
        width     = how wide the text box is
        font_size = size of text. This and "rows" effect overall height
        label     = what is shown when there is no text. "" = nothing
        value     = text entered into box. "" = nothing
        alignment = Number to indicate how you want text aligned
                    (1=Automatic, 2=Left, 3=Center, 4=Right, 5=Justified)
        ]]
        --ARMOUR
        --Armour Names
        --Armour Name1 textbox
        {
            pos       = {-1.15,0.1,-1.62},
            rows      = 1,
            width     = 2400,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Armour Name2 textbox
        {
            pos       = {-1.15,0.1,-1.541},
            rows      = 1,
            width     = 2400,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Armour Name3 textbox
        {
            pos       = {-1.15,0.1,-1.462},
            rows      = 1,
            width     = 2400,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Armour Name4 textbox
        {
            pos       = {-1.15,0.1,-1.383},
            rows      = 1,
            width     = 2400,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Armour Name5 textbox
        {
            pos       = {-1.15,0.1,-1.305},
            rows      = 1,
            width     = 2400,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Armour Locations
        --Armour Location1 textbox
        {
            pos       = {-0.7,0.1,-1.62},
            rows      = 1,
            width     = 1500,
            font_size = 250,
            label     = "Locations",
            value     = "",
            alignment = 2
        },
        --Armour Location2 textbox
        {
            pos       = {-0.7,0.1,-1.541},
            rows      = 1,
            width     = 1500,
            font_size = 250,
            label     = "Locations",
            value     = "",
            alignment = 2
        },
        --Armour Location3 textbox
        {
            pos       = {-0.7,0.1,-1.462},
            rows      = 1,
            width     = 1500,
            font_size = 250,
            label     = "Locations",
            value     = "",
            alignment = 2
        },
        --Armour Location4 textbox
        {
            pos       = {-0.7,0.1,-1.383},
            rows      = 1,
            width     = 1500,
            font_size = 250,
            label     = "Locations",
            value     = "",
            alignment = 2
        },
        --Armour Location5 textbox
        {
            pos       = {-0.7,0.1,-1.305},
            rows      = 1,
            width     = 1500,
            font_size = 250,
            label     = "Locations",
            value     = "",
            alignment = 2
        },
        --Armour Enc
        --Armour Enc1 textbox
        {
            pos       = {-0.47,0.1,-1.62},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Armour Enc2 textbox
        {
            pos       = {-0.47,0.1,-1.541},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Armour Enc3 textbox
        {
            pos       = {-0.47,0.1,-1.462},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Armour Enc4 textbox
        {
            pos       = {-0.47,0.1,-1.383},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Armour Enc5 textbox
        {
            pos       = {-0.47,0.1,-1.305},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Armour AP
        --Armour AP1 textbox
        {
            pos       = {-0.326,0.1,-1.62},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour AP2 textbox
        {
            pos       = {-0.326,0.1,-1.541},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour AP3 textbox
        {
            pos       = {-0.326,0.1,-1.462},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour AP4 textbox
        {
            pos       = {-0.326,0.1,-1.383},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour AP5 textbox
        {
            pos       = {-0.326,0.1,-1.305},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour Qualities
        --Armour Qualities1 textbox
        {
            pos       = {0.111,0.1,-1.62},
            rows      = 1,
            width     = 3200,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 3
        },
        --Armour Qualities2 textbox
        {
            pos       = {0.111,0.1,-1.541},
            rows      = 1,
            width     = 3200,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 3
        },
        --Armour Qualities3 textbox
        {
            pos       = {0.111,0.1,-1.462},
            rows      = 1,
            width     = 3200,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 3
        },
        --Armour Qualities4 textbox
        {
            pos       = {0.111,0.1,-1.383},
            rows      = 1,
            width     = 3200,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 3
        },
        --Armour Qualities5 textbox
        {
            pos       = {0.111,0.1,-1.305},
            rows      = 1,
            width     = 3200,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 3
        },
        --Armour Points
        --Armour Points Head textbox
        {
            pos       = {0.651,0.1,-1.617},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour Points Right Arm textbox
        {
            pos       = {0.651,0.1,-1.297},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour Points Right Leg textbox
        {
            pos       = {0.651,0.1,-0.945},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour Points Shield textbox
        {
            pos       = {0.651,0.1,-0.679},
            rows      = 1,
            width     = 350,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour Points Left Arm textbox
        {
            pos       = {1.279,0.1,-1.48},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour Points Body textbox
        {
            pos       = {1.279,0.1,-1.144},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --Armour Points Left Leg textbox
        {
            pos       = {1.279,0.1,-0.755},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "AP",
            value     = "",
            alignment = 3
        },
        --TRAPPINGS
        --Trappings Name textbox
        {
            pos       = {-1.03,0.1,-0.404},
            rows      = 22,
            width     = 3400,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Trappings Enc textbox
        {
            pos       = {-0.565,0.1,-0.404},
            rows      = 22,
            width     = 500,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --PSYCHOLOGY
        --Psychology textbox
        {
            pos       = {0.015,0.1,-1.056},
            rows      = 1,
            width     = 4000,
            font_size = 250,
            label     = "Psych",
            value     = "",
            alignment = 2
        },
        --Psychology2 textbox
        {
            pos       = {0.015,0.1,-0.977},
            rows      = 1,
            width     = 4000,
            font_size = 250,
            label     = "Psych",
            value     = "",
            alignment = 2
        },
        --Psychology3 textbox
        {
            pos       = {0.015,0.1,-0.897},
            rows      = 1,
            width     = 4000,
            font_size = 250,
            label     = "Psych",
            value     = "",
            alignment = 2
        },
        --notes textbox
        {
            pos       = {0.012,0.1,-0.562},
            rows      = 4,
            width     = 4000,
            font_size = 250,
            label     = "Notes",
            value     = "",
            alignment = 2
        },
        --WEALTH
        --Brass textbox
        {
            pos       = {-0.147,0.1,-0.208},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "Brass",
            value     = "",
            alignment = 3
        },
        --Silver textbox
        {
            pos       = {-0.147,0.1,-0.035},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "Silver",
            value     = "",
            alignment = 3
        },
        --Gold textbox
        {
            pos       = {-0.147,0.1,0.129},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "Gold",
            value     = "",
            alignment = 3
        },
        --ENCUMBRANCE
        --Encumbrance Weapons textbox
        {
            pos       = {0.37,0.1,-0.243},
            rows      = 1,
            width     = 800,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Encumbrance Armour textbox
        {
            pos       = {0.37,0.1,-0.139},
            rows      = 1,
            width     = 800,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Encumbrance Trappings textbox
        {
            pos       = {0.37,0.1,-0.035},
            rows      = 1,
            width     = 800,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Max Enc. textbox
        {
            pos       = {0.37,0.1,0.065},
            rows      = 1,
            width     = 800,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Total Enc. textbox
        {
            pos       = {0.37,0.1,0.168},
            rows      = 1,
            width     = 800,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --WOUNDS
        --Wounds SB textbox
        {
            pos       = {0.797,0.1,-0.246},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "SB",
            value     = "",
            alignment = 3
        },
        --Wounds TBx2 textbox
        {
            pos       = {0.797,0.1,-0.144},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "TB2",
            value     = "",
            alignment = 3
        },
        --Wounds WPB textbox
        {
            pos       = {0.797,0.1,-0.042},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "WP",
            value     = "",
            alignment = 3
        },
        --Hardy textbox
        {
            pos       = {0.797,0.1,0.06},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "Hd",
            value     = "",
            alignment = 3
        },
        --Wounds textbox
        {
            pos       = {0.797,0.1,0.162},
            rows      = 1,
            width     = 500,
            font_size = 250,
            label     = "W",
            value     = "",
            alignment = 3
        },
        --Wounds Notes textbox
        {
            pos       = {1.136,0.1,-0.042},
            rows      = 9,
            width     = 2500,
            font_size = 250,
            label     = "Wounds",
            value     = "",
            alignment = 2
        },
        --WEAPONS ROW 1
        --Weapons Name textbox
        {
            pos       = {-1.02,0.1,0.5},
            rows      = 1,
            width     = 3600,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Weapons Group textbox
        {
            pos       = {-0.51,0.1,0.5},
            rows      = 1,
            width     = 1000,
            font_size = 200,
            label     = "Group",
            value     = "",
            alignment = 3
        },
        --Weapons Encumbrance textbox
        {
            pos       = {-0.313,0.1,0.5},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Weapons Range/Reach textbox
        {
            pos       = {-0.091,0.1,0.5},
            rows      = 1,
            width     = 1100,
            font_size = 250,
            label     = "Rng",
            value     = "",
            alignment = 3
        },
        --Weapons Damage textbox
        {
            pos       = {0.207,0.1,0.5},
            rows      = 1,
            width     = 1400,
            font_size = 250,
            label     = "Damage",
            value     = "",
            alignment = 3
        },
        --Weapons Qualities textbox
        {
            pos       = {0.895,0.1,0.5},
            rows      = 1,
            width     = 4800,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 2
        },
        --WEAPONS ROW 2
        --Weapons Name2 textbox
        {
            pos       = {-1.02,0.1,0.579},
            rows      = 1,
            width     = 3600,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Weapons Group2 textbox
        {
            pos       = {-0.51,0.1,0.579},
            rows      = 1,
            width     = 1000,
            font_size = 200,
            label     = "Group",
            value     = "",
            alignment = 3
        },
        --Weapons Encumbrance2 textbox
        {
            pos       = {-0.313,0.1,0.579},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Weapons Range/Reach2 textbox
        {
            pos       = {-0.091,0.1,0.579},
            rows      = 1,
            width     = 1100,
            font_size = 250,
            label     = "Rng",
            value     = "",
            alignment = 3
        },
        --Weapons Damage2 textbox
        {
            pos       = {0.207,0.1,0.579},
            rows      = 1,
            width     = 1400,
            font_size = 250,
            label     = "Damage",
            value     = "",
            alignment = 3
        },
        --Weapons Qualities2 textbox
        {
            pos       = {0.895,0.1,0.579},
            rows      = 1,
            width     = 4800,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 2
        },
        --WEAPONS ROW 3
        --Weapons Name3 textbox
        {
            pos       = {-1.02,0.1,0.658},
            rows      = 1,
            width     = 3600,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Weapons Group3 textbox
        {
            pos       = {-0.51,0.1,0.658},
            rows      = 1,
            width     = 1000,
            font_size = 200,
            label     = "Group",
            value     = "",
            alignment = 3
        },
        --Weapons Encumbrance3 textbox
        {
            pos       = {-0.313,0.1,0.658},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Weapons Range/Reach3 textbox
        {
            pos       = {-0.091,0.1,0.658},
            rows      = 1,
            width     = 1100,
            font_size = 250,
            label     = "Rng",
            value     = "",
            alignment = 3
        },
        --Weapons Damage3 textbox
        {
            pos       = {0.207,0.1,0.658},
            rows      = 1,
            width     = 1400,
            font_size = 250,
            label     = "Damage",
            value     = "",
            alignment = 3
        },
        --Weapons Qualities3 textbox
        {
            pos       = {0.895,0.1,0.658},
            rows      = 1,
            width     = 4800,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 2
        },
        --WEAPONS ROW 4
        --Weapons Name4 textbox
        {
            pos       = {-1.02,0.1,0.737},
            rows      = 1,
            width     = 3600,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Weapons Group4 textbox
        {
            pos       = {-0.51,0.1,0.737},
            rows      = 1,
            width     = 1000,
            font_size = 200,
            label     = "Group",
            value     = "",
            alignment = 3
        },
        --Weapons Encumbrance4 textbox
        {
            pos       = {-0.313,0.1,0.737},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Weapons Range/Reach4 textbox
        {
            pos       = {-0.091,0.1,0.737},
            rows      = 1,
            width     = 1100,
            font_size = 250,
            label     = "Rng",
            value     = "",
            alignment = 3
        },
        --Weapons Damage4 textbox
        {
            pos       = {0.207,0.1,0.737},
            rows      = 1,
            width     = 1400,
            font_size = 250,
            label     = "Damage",
            value     = "",
            alignment = 3
        },
        --Weapons Qualities4 textbox
        {
            pos       = {0.895,0.1,0.737},
            rows      = 1,
            width     = 4800,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 2
        },
        --WEAPONS ROW 5
        --Weapons Name5 textbox
        {
            pos       = {-1.02,0.1,0.816},
            rows      = 1,
            width     = 3600,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Weapons Group5 textbox
        {
            pos       = {-0.51,0.1,0.816},
            rows      = 1,
            width     = 1000,
            font_size = 200,
            label     = "Group",
            value     = "",
            alignment = 3
        },
        --Weapons Encumbrance5 textbox
        {
            pos       = {-0.313,0.1,0.816},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Weapons Range/Reach5 textbox
        {
            pos       = {-0.091,0.1,0.816},
            rows      = 1,
            width     = 1100,
            font_size = 250,
            label     = "Rng",
            value     = "",
            alignment = 3
        },
        --Weapons Damage5 textbox
        {
            pos       = {0.207,0.1,0.816},
            rows      = 1,
            width     = 1400,
            font_size = 250,
            label     = "Damage",
            value     = "",
            alignment = 3
        },
        --Weapons Qualities5 textbox
        {
            pos       = {0.895,0.1,0.816},
            rows      = 1,
            width     = 4800,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 2
        },
        --WEAPONS ROW 6
        --Weapons Name6 textbox
        {
            pos       = {-1.02,0.1,0.894},
            rows      = 1,
            width     = 3600,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Weapons Group6 textbox
        {
            pos       = {-0.51,0.1,0.894},
            rows      = 1,
            width     = 1000,
            font_size = 200,
            label     = "Group",
            value     = "",
            alignment = 3
        },
        --Weapons Encumbrance6 textbox
        {
            pos       = {-0.313,0.1,0.894},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Weapons Range/Reach6 textbox
        {
            pos       = {-0.091,0.1,0.894},
            rows      = 1,
            width     = 1100,
            font_size = 250,
            label     = "Rng",
            value     = "",
            alignment = 3
        },
        --Weapons Damage6 textbox
        {
            pos       = {0.207,0.1,0.894},
            rows      = 1,
            width     = 1400,
            font_size = 250,
            label     = "Damage",
            value     = "",
            alignment = 3
        },
        --Weapons Qualities6 textbox
        {
            pos       = {0.895,0.1,0.894},
            rows      = 1,
            width     = 4800,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 2
        },
        --WEAPONS ROW 7
        --Weapons Name7 textbox
        {
            pos       = {-1.02,0.1,0.972},
            rows      = 1,
            width     = 3600,
            font_size = 250,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Weapons Group7 textbox
        {
            pos       = {-0.51,0.1,0.972},
            rows      = 1,
            width     = 1000,
            font_size = 200,
            label     = "Group",
            value     = "",
            alignment = 3
        },
        --Weapons Encumbrance7 textbox
        {
            pos       = {-0.313,0.1,0.972},
            rows      = 1,
            width     = 700,
            font_size = 250,
            label     = "Enc",
            value     = "",
            alignment = 3
        },
        --Weapons Range/Reach7 textbox
        {
            pos       = {-0.091,0.1,0.972},
            rows      = 1,
            width     = 1100,
            font_size = 250,
            label     = "Rng",
            value     = "",
            alignment = 3
        },
        --Weapons Damage7 textbox
        {
            pos       = {0.207,0.1,0.972},
            rows      = 1,
            width     = 1400,
            font_size = 250,
            label     = "Damage",
            value     = "",
            alignment = 3
        },
        --Weapons Qualities7 textbox
        {
            pos       = {0.895,0.1,0.972},
            rows      = 1,
            width     = 4800,
            font_size = 250,
            label     = "Qualities",
            value     = "",
            alignment = 2
        },
        --SPELLS AND PRAYERS ROW 1
        --Spells and Prayers Name textbox
        {
            pos       = {-1.122,0.1,1.297},
            rows      = 1,
            width     = 2800,
            font_size = 200,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Spells and Prayers TN textbox
        {
            pos       = {-0.71,0.1,1.297},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "TN",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Range textbox
        {
            pos       = {-0.473,0.1,1.297},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Range",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Target textbox
        {
            pos       = {-0.23,0.1,1.297},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Target",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Duration textbox
        {
            pos       = {0.013,0.1,1.297},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Duration",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Effect textbox
        {
            pos       = {0.769,0.1,1.297},
            rows      = 1,
            width     = 5900,
            font_size = 200,
            label     = "Effect",
            value     = "",
            alignment = 2
        },
        --SPELLS AND PRAYERS ROW 2
        --Spells and Prayers Name2 textbox
        {
            pos       = {-1.122,0.1,1.376},
            rows      = 1,
            width     = 2800,
            font_size = 200,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Spells and Prayers TN2 textbox
        {
            pos       = {-0.71,0.1,1.376},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "TN",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Range2 textbox
        {
            pos       = {-0.473,0.1,1.376},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Range",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Target2 textbox
        {
            pos       = {-0.23,0.1,1.376},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Target",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Duration2 textbox
        {
            pos       = {0.013,0.1,1.376},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Duration",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Effect2 textbox
        {
            pos       = {0.769,0.1,1.376},
            rows      = 1,
            width     = 5900,
            font_size = 200,
            label     = "Effect",
            value     = "",
            alignment = 2
        },
        --SPELLS AND PRAYERS ROW 3
        --Spells and Prayers Name3 textbox
        {
            pos       = {-1.122,0.1,1.454},
            rows      = 1,
            width     = 2800,
            font_size = 200,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Spells and Prayers TN3 textbox
        {
            pos       = {-0.71,0.1,1.454},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "TN",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Range3 textbox
        {
            pos       = {-0.473,0.1,1.454},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Range",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Target3 textbox
        {
            pos       = {-0.23,0.1,1.454},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Target",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Duration3 textbox
        {
            pos       = {0.013,0.1,1.454},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Duration",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Effect3 textbox
        {
            pos       = {0.769,0.1,1.454},
            rows      = 1,
            width     = 5900,
            font_size = 200,
            label     = "Effect",
            value     = "",
            alignment = 2
        },
        --SPELLS AND PRAYERS ROW 4
        --Spells and Prayers Name4 textbox
        {
            pos       = {-1.122,0.1,1.532},
            rows      = 1,
            width     = 2800,
            font_size = 200,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Spells and Prayers TN4 textbox
        {
            pos       = {-0.71,0.1,1.532},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "TN",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Range4 textbox
        {
            pos       = {-0.473,0.1,1.532},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Range",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Target4 textbox
        {
            pos       = {-0.23,0.1,1.532},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Target",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Duration4 textbox
        {
            pos       = {0.013,0.1,1.532},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Duration",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Effect4 textbox
        {
            pos       = {0.769,0.1,1.532},
            rows      = 1,
            width     = 5900,
            font_size = 200,
            label     = "Effect",
            value     = "",
            alignment = 2
        },
        --SPELLS AND PRAYERS ROW 5
        --Spells and Prayers Name5 textbox
        {
            pos       = {-1.122,0.1,1.610},
            rows      = 1,
            width     = 2800,
            font_size = 200,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Spells and Prayers TN5 textbox
        {
            pos       = {-0.71,0.1,1.610},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "TN",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Range5 textbox
        {
            pos       = {-0.473,0.1,1.610},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Range",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Target5 textbox
        {
            pos       = {-0.23,0.1,1.610},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Target",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Duration5 textbox
        {
            pos       = {0.013,0.1,1.610},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Duration",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Effect5 textbox
        {
            pos       = {0.769,0.1,1.610},
            rows      = 1,
            width     = 5900,
            font_size = 200,
            label     = "Effect",
            value     = "",
            alignment = 2
        },
        --SPELLS AND PRAYERS ROW 6
        --Spells and Prayers Name6 textbox
        {
            pos       = {-1.122,0.1,1.688},
            rows      = 1,
            width     = 2800,
            font_size = 200,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Spells and Prayers TN6 textbox
        {
            pos       = {-0.71,0.1,1.688},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "TN",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Range6 textbox
        {
            pos       = {-0.473,0.1,1.688},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Range",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Target6 textbox
        {
            pos       = {-0.23,0.1,1.688},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Target",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Duration6 textbox
        {
            pos       = {0.013,0.1,1.688},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Duration",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Effect6 textbox
        {
            pos       = {0.769,0.1,1.688},
            rows      = 1,
            width     = 5900,
            font_size = 200,
            label     = "Effect",
            value     = "",
            alignment = 2
        },
        --SPELLS AND PRAYERS ROW 7
        --Spells and Prayers Name7 textbox
        {
            pos       = {-1.122,0.1,1.766},
            rows      = 1,
            width     = 2800,
            font_size = 200,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Spells and Prayers TN7 textbox
        {
            pos       = {-0.71,0.1,1.766},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "TN",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Range7 textbox
        {
            pos       = {-0.473,0.1,1.766},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Range",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Target7 textbox
        {
            pos       = {-0.23,0.1,1.766},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Target",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Duration7 textbox
        {
            pos       = {0.013,0.1,1.766},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Duration",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Effect7 textbox
        {
            pos       = {0.769,0.1,1.766},
            rows      = 1,
            width     = 5900,
            font_size = 200,
            label     = "Effect",
            value     = "",
            alignment = 2
        },
        --SPELLS AND PRAYERS ROW 8
        --Spells and Prayers Name8 textbox
        {
            pos       = {-1.122,0.1,1.844},
            rows      = 1,
            width     = 2800,
            font_size = 200,
            label     = "Name",
            value     = "",
            alignment = 2
        },
        --Spells and Prayers TN8 textbox
        {
            pos       = {-0.71,0.1,1.844},
            rows      = 1,
            width     = 900,
            font_size = 250,
            label     = "TN",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Range8 textbox
        {
            pos       = {-0.473,0.1,1.844},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Range",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Target8 textbox
        {
            pos       = {-0.23,0.1,1.844},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Target",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Duration8 textbox
        {
            pos       = {0.013,0.1,1.844},
            rows      = 1,
            width     = 1000,
            font_size = 250,
            label     = "Duration",
            value     = "",
            alignment = 3
        },
        --Spells and Prayers Effect8 textbox
        {
            pos       = {0.562,0.1,1.844},
            rows      = 1,
            width     = 3900,
            font_size = 200,
            label     = "Effect",
            value     = "",
            alignment = 2
        },
        --Spells and Prayers Sin Points textbox
        {
            pos       = {1.272,0.1,1.844},
            rows      = 1,
            width     = 1100,
            font_size = 250,
            label     = "Sin Points",
            value     = "",
            alignment = 2
        },
        --End of textboxes
    }
}



--Lua beyond this point, I recommend doing something more fun with your life

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

    spawnedButtonCount = 0
    --createCheckbox()
    --createCounter()
    createTextbox()
end



--Click functions for buttons



--Checks or unchecks the given box
function click_checkbox(tableIndex, buttonIndex)
    if ref_buttonData.checkbox[tableIndex].state == true then
        ref_buttonData.checkbox[tableIndex].state = false
        self.editButton({index=buttonIndex, label=""})
    else
        ref_buttonData.checkbox[tableIndex].state = true
        self.editButton({index=buttonIndex, label=string.char(10008)})
    end
    updateSave()
end

--Applies value to given counter display
function click_counter(tableIndex, buttonIndex, amount)
    ref_buttonData.counter[tableIndex].value = ref_buttonData.counter[tableIndex].value + amount
    self.editButton({index=buttonIndex, label=ref_buttonData.counter[tableIndex].value})
    updateSave()
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



--Button creation



--Makes checkboxes
function createCheckbox()
    for i, data in ipairs(ref_buttonData.checkbox) do
        --Sets up reference function
        local buttonNumber = spawnedButtonCount
        local funcName = "checkbox"..i
        local func = function() click_checkbox(i, buttonNumber) end
        self.setVar(funcName, func)
        --Sets up label
        local label = ""
        if data.state==true then label=string.char(10008) end
        --Creates button and counts it
        self.createButton({
            label=label, click_function=funcName, function_owner=self,
            position=data.pos, height=data.size, width=data.size,
            font_size=data.size, scale=buttonScale,
            color=buttonColor, font_color=buttonFontColor
        })
        spawnedButtonCount = spawnedButtonCount + 1
    end
end

--Makes counters
function createCounter()
    for i, data in ipairs(ref_buttonData.counter) do
        --Sets up display
        local displayNumber = spawnedButtonCount
        --Sets up label
        local label = data.value
        --Sets height/width for display
        local size = data.size
        if data.hideBG == true then size = 0 end
        --Creates button and counts it
        self.createButton({
            label=label, click_function="click_none", function_owner=self,
            position=data.pos, height=size, width=size,
            font_size=data.size, scale=buttonScale,
            color=buttonColor, font_color=buttonFontColor
        })
        spawnedButtonCount = spawnedButtonCount + 1

        --Sets up add 1
        local funcName = "counterAdd"..i
        local func = function() click_counter(i, displayNumber, 1) end
        self.setVar(funcName, func)
        --Sets up label
        local label = "+"
        --Sets up position
        local offsetDistance = (data.size/2 + data.size/4) * (buttonScale[1] * 0.002)
        local pos = {data.pos[1] + offsetDistance, data.pos[2], data.pos[3]}
        --Sets up size
        local size = data.size / 2
        --Creates button and counts it
        self.createButton({
            label=label, click_function=funcName, function_owner=self,
            position=pos, height=size, width=size,
            font_size=size, scale=buttonScale,
            color=buttonColor, font_color=buttonFontColor
        })
        spawnedButtonCount = spawnedButtonCount + 1

        --Sets up subtract 1
        local funcName = "counterSub"..i
        local func = function() click_counter(i, displayNumber, -1) end
        self.setVar(funcName, func)
        --Sets up label
        local label = "-"
        --Set up position
        local pos = {data.pos[1] - offsetDistance, data.pos[2], data.pos[3]}
        --Creates button and counts it
        self.createButton({
            label=label, click_function=funcName, function_owner=self,
            position=pos, height=size, width=size,
            font_size=size, scale=buttonScale,
            color=buttonColor, font_color=buttonFontColor
        })
        spawnedButtonCount = spawnedButtonCount + 1
    end
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