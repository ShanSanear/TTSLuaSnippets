--Color information for button text (r,g,b, values of 0-1)
buttonFontColor = {0,0,0}
--Color information for button background
buttonColor = {1,1,1}
--Change scale of button (Avoid changing if possible)
buttonScale = {0.1,0.1,0.1}
buttonScaleToDisable = {-0.1, 0.1, 0.1}
rotationToDisable = {x=180, y=180, z=0}
standardRotation = {x=0, y=0, z=0}

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
        --Name textbox
        {
            pos       = {-0.752,0.1,-1.58},
            rows      = 1,
            width     = 5000,
            font_size = 250,
            label     = "Imię",
            value     = "",
            alignment = 2
        },
        --Species textbox
        {
            pos       = {0.35,0.1,-1.58},
            rows      = 1,
            width     = 2000,
            font_size = 250,
            label     = "Rasa",
            value     = "",
            alignment = 2
        },
        --Class textbox
        {
            pos       = {1.119,0.1,-1.58},
            rows      = 1,
            width     = 2000,
            font_size = 250,
            label     = "Klasa",
            value     = "",
            alignment = 2
        },
        --Career textbox
        {
            pos       = {-0.682,0.1,-1.505},
            rows      = 1,
            width     = 5000,
            font_size = 250,
            label     = "Profesja",
            value     = "",
            alignment = 2
        },
        --Career Tier textbox
        {
            pos       = {0.910,0.1,-1.505},
            rows      = 1,
            width     = 5000,
            font_size = 250,
            label     = "Poziom profesji",
            value     = "",
            alignment = 2
        },
        --Career Path textbox
        {
            pos       = {-0.199,0.1,-1.425},
            rows      = 1,
            width     = 8000,
            font_size = 250,
            label     = "Ścieżka profesji",
            value     = "",
            alignment = 2
        },
        --Status textbox
        {
            pos       = {1.124,0.1,-1.425},
            rows      = 1,
            width     = 2000,
            font_size = 250,
            label     = "Status",
            value     = "",
            alignment = 2
        },
        --Age textbox
        {
            pos       = {-1.0,0.1,-1.34},
            rows      = 1,
            width     = 2000,
            font_size = 250,
            label     = "Wiek",
            value     = "",
            alignment = 2
        },
        --Height textbox
        {
            pos       = {-0.279,0.1,-1.34},
            rows      = 1,
            width     = 2000,
            font_size = 250,
            label     = "Wzrost",
            value     = "",
            alignment = 2
        },
        --Hair textbox
        {
            pos       = {0.38,0.1,-1.34},
            rows      = 1,
            width     = 2000,
            font_size = 250,
            label     = "Włosy",
            value     = "",
            alignment = 2
        },
        --Eyes textbox
        {
            pos       = {1.074,0.1,-1.34},
            rows      = 1,
            width     = 2000,
            font_size = 250,
            label     = "Oczy",
            value     = "",
            alignment = 2
        },
        --ATTRIBUTES INITIAL
        --Weapon Skill Initial textbox
        {
            pos       = {-1.111,0.1,-0.99},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "WW",
            value     = "",
            alignment = 3,
        },
        --Ballistic Skill Initial textbox
        {
            pos       = {-1.007,0.1,-0.99},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "US",
            value     = "",
            alignment = 3
        },
        --Strength Initial textbox
        {
            pos       = {-0.903,0.1,-0.99},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "S",
            value     = "",
            alignment = 3
        },
        --Toughness Initial textbox
        {
            pos       = {-0.801,0.1,-0.99},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Wt",
            value     = "",
            alignment = 3
        },
        --Initiative Initial textbox
        {
            pos       = {-0.697,0.1,-0.99},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "I",
            value     = "",
            alignment = 3
        },
        --Agility Initial textbox
        {
            pos       = {-0.594,0.1,-0.99},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Zw",
            value     = "",
            alignment = 3
        },
        --Dexterity Initial textbox
        {
            pos       = {-0.492,0.1,-0.99},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "Zr",
            value     = "",
            alignment = 3
        },
        --Intelligence Initial textbox
        {
            pos       = {-0.389,0.1,-0.99},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "Int",
            value     = "",
            alignment = 3
        },
        --Willpower Initial textbox
        {
            pos       = {-0.286,0.1,-0.99},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "SW",
            value     = "",
            alignment = 3
        },
        --Fellowship Initial textbox
        {
            pos       = {-0.183,0.1,-0.99},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "Ogd",
            value     = "",
            alignment = 3
        },
        --ATTRIBUTES ADVANCES
        --Weapon Skill Advance textbox
        {
            pos       = {-1.111,0.1,-0.88},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "WW",
            value     = "",
            alignment = 3
        },
        --Ballistic Skill Advance textbox
        {
            pos       = {-1.007,0.1,-0.88},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "US",
            value     = "",
            alignment = 3
        },
        --Strength Advance textbox
        {
            pos       = {-0.903,0.1,-0.88},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "S",
            value     = "",
            alignment = 3
        },
        --Toughness Advance textbox
        {
            pos       = {-0.801,0.1,-0.88},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Wt",
            value     = "",
            alignment = 3
        },
        --Initiative Advance textbox
        {
            pos       = {-0.697,0.1,-0.88},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "I",
            value     = "",
            alignment = 3
        },
        --Agility Advance textbox
        {
            pos       = {-0.594,0.1,-0.88},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Zw",
            value     = "",
            alignment = 3
        },
        --Dexterity Advance textbox
        {
            pos       = {-0.492,0.1,-0.88},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "Zr",
            value     = "",
            alignment = 3
        },
        --Intelligence Advance textbox
        {
            pos       = {-0.389,0.1,-0.88},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "Int",
            value     = "",
            alignment = 3
        },
        --Willpower Advance textbox
        {
            pos       = {-0.286,0.1,-0.88},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "SW",
            value     = "",
            alignment = 3
        },
        --Fellowship Advance textbox
        {
            pos       = {-0.183,0.1,-0.88},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "Ogd",
            value     = "",
            alignment = 3
        },
        --ATTRIBUTES CURRENT
        --Weapon Skill Current textbox
        {
            pos       = {-1.111,0.1,-0.77},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "WW",
            value     = "",
            alignment = 3
        },
        --Ballistic Skill Current textbox
        {
            pos       = {-1.007,0.1,-0.77},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "US",
            value     = "",
            alignment = 3
        },
        --Strength Current textbox
        {
            pos       = {-0.903,0.1,-0.77},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "S",
            value     = "",
            alignment = 3
        },
        --Toughness Current textbox
        {
            pos       = {-0.801,0.1,-0.77},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Wt",
            value     = "",
            alignment = 3
        },
        --Initiative Current textbox
        {
            pos       = {-0.697,0.1,-0.77},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "I",
            value     = "",
            alignment = 3
        },
        --Agility Current textbox
        {
            pos       = {-0.594,0.1,-0.77},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Zw",
            value     = "",
            alignment = 3
        },
        --Dexterity Current textbox
        {
            pos       = {-0.492,0.1,-0.77},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "Zr",
            value     = "",
            alignment = 3
        },
        --Intelligence Current textbox
        {
            pos       = {-0.389,0.1,-0.77},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "Int",
            value     = "",
            alignment = 3
        },
        --Willpower Current textbox
        {
            pos       = {-0.286,0.1,-0.77},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "SW",
            value     = "",
            alignment = 3
        },
        --Fellowship Current textbox
        {
            pos       = {-0.183,0.1,-0.77},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "Ogd",
            value     = "",
            alignment = 3
        },
        --END OF ATTRIBUTES
        --Fate textbox
        {
            pos       = {0.29,0.1,-0.758},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "PP",
            value     = "",
            alignment = 3
        },
        --Fortune textbox
        {
            pos       = {0.65,0.1,-0.758},
            rows      = 1,
            width     = 425,
            font_size = 250,
            label     = "PS",
            value     = "",
            alignment = 3
        },
        --Resilience textbox
        {
            pos       = {0.1,0.1,-1.011},
            rows      = 1,
            width     = 600,
            font_size = 250,
            label     = "Bohater",
            value     = "",
            alignment = 3
        },
        --Resolve textbox
        {
            pos       = {0.40,0.1,-1.011},
            rows      = 1,
            width     = 600,
            font_size = 250,
            label     = "Determinacja",
            value     = "",
            alignment = 3
        },
        --Motivation textbox
        {
            pos       = {0.7,0.1,-1.011},
            rows      = 1,
            width     = 650,
            font_size = 250,
            label     = "Motywacja",
            value     = "",
            alignment = 3
        },
        --Experience Current textbox
        {
            pos       = {0.98,0.1,-1.002},
            rows      = 1,
            width     = 850,
            font_size = 250,
            label     = "XPAkt",
            value     = "",
            alignment = 3
        },
        --Experience Spent textbox
        {
            pos       = {1.18,0.1,-1.002},
            rows      = 1,
            width     = 800,
            font_size = 250,
            label     = "XPWyd",
            value     = "",
            alignment = 3
        },
        --Experience Total textbox
        {
            pos       = {1.38,0.1,-1.002},
            rows      = 1,
            width     = 850,
            font_size = 250,
            label     = "XPCał",
            value     = "",
            alignment = 3
        },
        --Movement textbox
        {
            pos       = {0.95,0.1,-0.76},
            rows      = 1,
            width     = 600,
            font_size = 250,
            label     = "Sz",
            value     = "",
            alignment = 3
        },
        --Movement Walk textbox
        {
            pos       = {1.20,0.1,-0.76},
            rows      = 1,
            width     = 600,
            font_size = 250,
            label     = "SzCh",
            value     = "",
            alignment = 3
        },
        --Movement Run textbox
        {
            pos       = {1.40,0.1,-0.76},
            rows      = 1,
            width     = 600,
            font_size = 250,
            label     = "SzB",
            value     = "",
            alignment = 3
        },
        --SKILLS
        --Art Characteristic textbox
        -- Athletics Attribute textbox
        {
            pos       = {-0.809,0.1,-0.423},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Atl",
            value     = "",
            alignment = 3
        },
        --Atlethics Advance textbox
        {
            pos       = {-0.696,0.1,-0.423},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Atl",
            value     = "",
            alignment = 3
        },
        --Atlethics Skill textbox
        {
            pos       = {-0.579,0.1,-0.423},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Atl",
            value     = "",
            alignment = 3
        },
        --Basic Melee Weapon Attribute textbox
        {
            pos       = {-0.809,0.1,-0.343},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "BBP",
            value     = "",
            alignment = 3
        },
        --Basic Melee Weapon Advance textbox
        {
            pos       = {-0.696,0.1,-0.343},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "BBP",
            value     = "",
            alignment = 3
        },
        --Basic Melee Weapon Skill textbox
        {
            pos       = {-0.579,0.1,-0.343},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "BBP",
            value     = "",
            alignment = 3
        },
        --Bribery Characteristic textbox
        {
            pos       = {-0.809,0.1,-0.263},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "BBD",
            value     = "",
            alignment = 3
        },
        --Bribery Advance textbox
        {
            pos       = {-0.696,0.1,-0.263},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "BBD",
            value     = "",
            alignment = 3
        },
        --Bribery Skill textbox
        {
            pos       = {-0.579,0.1,-0.263},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "BBD",
            value     = "",
            alignment = 3
        },
        --Charm Characteristic textbox
        {
            pos       = {-0.809,0.1,-0.183},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Ch",
            value     = "",
            alignment = 3
        },
        --Charm Advance textbox
        {
            pos       = {-0.696,0.1,-0.183},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Ch",
            value     = "",
            alignment = 3
        },
        --Charm Skill textbox
        {
            pos       = {-0.579,0.1,-0.183},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Ch",
            value     = "",
            alignment = 3
        },
        --Charm Animal Characteristic textbox
        {
            pos       = {-0.809,0.1,-0.103},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Dow",
            value     = "",
            alignment = 3
        },
        --Charm Animal Advance textbox
        {
            pos       = {-0.696,0.1,-0.103},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Dow",
            value     = "",
            alignment = 3
        },
        --Charm Animal Skill textbox
        {
            pos       = {-0.579,0.1,-0.103},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Dow",
            value     = "",
            alignment = 3
        },
        --Climb Characteristic textbox
        {
            pos       = {-0.809,0.1,-0.023},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Haz",
            value     = "",
            alignment = 3
        },
        --Climb Advance textbox
        {
            pos       = {-0.696,0.1,-0.023},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Haz",
            value     = "",
            alignment = 3
        },
        --Climb Skill textbox
        {
            pos       = {-0.579,0.1,-0.023},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Haz",
            value     = "",
            alignment = 3
        },
        --Cool Characteristic textbox
        {
            pos       = {-0.809,0.1,0.057},
            rows      = 1,
            width     = 450,
            font_size = 250,
            label     = "In",
            value     = "",
            alignment = 3
        },
        --Cool Advance textbox
        {
            pos       = {-0.695,0.1,0.057},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "In",
            value     = "",
            alignment = 3
        },
        --Cool Skill textbox
        {
            pos       = {-0.579,0.1,0.057},
            rows      = 1,
            width     = 450,
            font_size = 250,
            label     = "In",
            value     = "",
            alignment = 3
        },
        --Consume Alcohol Characteristic textbox
        {
            pos       = {-0.809,0.1,0.137},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Jeź",
            value     = "",
            alignment = 3
        },
        --Consume Alcohol Advance textbox
        {
            pos       = {-0.695,0.1,0.137},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Jeź",
            value     = "",
            alignment = 3
        },
        --Consume Alcohol Skill textbox
        {
            pos       = {-0.579,0.1,0.137},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Jeź",
            value     = "",
            alignment = 3
        },
        --Dodge Characteristic textbox
        {
            pos       = {-0.809,0.1,0.217},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "MG",
            value     = "",
            alignment = 3
        },
        --Dodge Advance textbox
        {
            pos       = {-0.695,0.1,0.217},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "MG",
            value     = "",
            alignment = 3
        },
        --Dodge Skill textbox
        {
            pos       = {-0.579,0.1,0.217},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "MG",
            value     = "",
            alignment = 3
        },
        --Drive Characteristic textbox
        {
            pos       = {-0.809,0.1,0.297},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Naw",
            value     = "",
            alignment = 3
        },
        --Drive Advance textbox
        {
            pos       = {-0.695,0.1,0.297},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Naw",
            value     = "",
            alignment = 3
        },
        --Drive Skill textbox
        {
            pos       = {-0.579,0.1,0.297},
            rows      = 1,
            width     = 400,
            font_size = 250,
            label     = "Naw",
            value     = "",
            alignment = 3
        },
        --Endurance Characteristic textbox
        {
            pos       = {-0.809,0.1,0.377},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Odp",
            value     = "",
            alignment = 3
        },
        --Endurance Advance textbox
        {
            pos       = {-0.695,0.1,0.377},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Odp",
            value     = "",
            alignment = 3
        },
        --Endurance Skill textbox
        {
            pos       = {-0.579,0.1,0.377},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Odp",
            value     = "",
            alignment = 3
        },
        --Entertain Characteristic textbox
        {
            pos       = {-0.809,0.1,0.457},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Opa",
            value     = "",
            alignment = 3
        },
        --Entertain Advance textbox
        {
            pos       = {-0.695,0.1,0.457},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Opa",
            value     = "",
            alignment = 3
        },
        --Entertain Skill textbox
        {
            pos       = {-0.579,0.1,0.457},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Opa",
            value     = "",
            alignment = 3
        },
        --Gamble Characteristic textbox
        {
            pos       = {-0.809,0.1,0.537},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Osw",
            value     = "",
            alignment = 3
        },
        --Gamble Advance textbox
        {
            pos       = {-0.695,0.1,0.537},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Osw",
            value     = "",
            alignment = 3
        },
        --Gamble Skill textbox
        {
            pos       = {-0.579,0.1,0.537},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Osw",
            value     = "",
            alignment = 3
        },
        --Gossip Characteristic textbox
        {
            pos       = {0.156,0.1,-0.423},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Per",
            value     = "",
            alignment = 3
        },
        --Gossip Advance textbox
        {
            pos       = {0.267,0.1,-0.423},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Per",
            value     = "",
            alignment = 3
        },
        --Gossip Skill textbox
        {
            pos       = {0.385,0.1,-0.423},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Per",
            value     = "",
            alignment = 3
        },
        --Haggle Characteristic textbox
        {
            pos       = {0.156,0.1,-0.343},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Plot",
            value     = "",
            alignment = 3
        },
        --Haggle Advance textbox
        {
            pos       = {0.267,0.1,-0.343},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Plot",
            value     = "",
            alignment = 3
        },
        --Haggle Skill textbox
        {
            pos       = {0.385,0.1,-0.343},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Plot",
            value     = "",
            alignment = 3
        },
        --Intimidate Characteristic textbox
        {
            pos       = {0.156,0.1,-0.263},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Pow",
            value     = "",
            alignment = 3
        },
        --Intimidate Advance textbox
        {
            pos       = {0.267,0.1,-0.263},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Pow",
            value     = "",
            alignment = 3
        },
        --Intimidate Skill textbox
        {
            pos       = {0.385,0.1,-0.263},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Pow",
            value     = "",
            alignment = 3
        },
        --Intuition Characteristic textbox
        {
            pos       = {0.156,0.1,-0.183},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Przek",
            value     = "",
            alignment = 3
        },
        --Intuition Advance textbox
        {
            pos       = {0.267,0.1,-0.183},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Przek",
            value     = "",
            alignment = 3
        },
        --Intuition Skill textbox
        {
            pos       = {0.385,0.1,-0.183},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Przek",
            value     = "",
            alignment = 3
        },
        --Leadership Characteristic textbox
        {
            pos       = {0.156,0.1,-0.103},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Skr",
            value     = "",
            alignment = 3
        },
        --Leadership Advance textbox
        {
            pos       = {0.267,0.1,-0.103},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Skr",
            value     = "",
            alignment = 3
        },
        --Leadership Skill textbox
        {
            pos       = {0.385,0.1,-0.103},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Skr",
            value     = "",
            alignment = 3
        },
        --Melee Basic Characteristic textbox
        {
            pos       = {0.156,0.1,-0.023},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Szt",
            value     = "",
            alignment = 3
        },
        --Melee Basic Advance textbox
        {
            pos       = {0.267,0.1,-0.023},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Szt",
            value     = "",
            alignment = 3
        },
        --Melee Basic Skill textbox
        {
            pos       = {0.385,0.1,-0.023},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Szt",
            value     = "",
            alignment = 3
        },
        --Melee Characteristic textbox
        {
            pos       = {0.156,0.1,0.057},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Przet",
            value     = "",
            alignment = 3
        },
        --Melee Advance textbox
        {
            pos       = {0.267,0.1,0.057},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Przet",
            value     = "",
            alignment = 3
        },
        --Melee Skill textbox
        {
            pos       = {0.385,0.1,0.057},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Przet",
            value     = "",
            alignment = 3
        },
        --Navigation Characteristic textbox
        {
            pos       = {0.156,0.1,0.137},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Targ",
            value     = "",
            alignment = 3
        },
        --Navigation Advance textbox
        {
            pos       = {0.267,0.1,0.137},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Targ",
            value     = "",
            alignment = 3
        },
        --Navigation Skill textbox
        {
            pos       = {0.385,0.1,0.137},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Targ",
            value     = "",
            alignment = 3
        },
        --Outdoor Survival Characteristic textbox
        {
            pos       = {0.156,0.1,0.217},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Uni",
            value     = "",
            alignment = 3
        },
        --Outdoor Survival Advance textbox
        {
            pos       = {0.267,0.1,0.217},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Uni",
            value     = "",
            alignment = 3
        },
        --Outdoor Survival Skill textbox
        {
            pos       = {0.385,0.1,0.217},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Uni",
            value     = "",
            alignment = 3
        },
        --Perception Characteristic textbox
        {
            pos       = {0.156,0.1,0.297},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Wio",
            value     = "",
            alignment = 3
        },
        --Perception Advance textbox
        {
            pos       = {0.267,0.1,0.297},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Wio",
            value     = "",
            alignment = 3
        },
        --Perception Skill textbox
        {
            pos       = {0.385,0.1,0.297},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Wio",
            value     = "",
            alignment = 3
        },
        --Ride Characteristic textbox
        {
            pos       = {0.156,0.1,0.377},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Wsp",
            value     = "",
            alignment = 3
        },
        --Ride Advance textbox
        {
            pos       = {0.267,0.1,0.377},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Wsp",
            value     = "",
            alignment = 3
        },
        --Ride Skill textbox
        {
            pos       = {0.385,0.1,0.377},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Wsp",
            value     = "",
            alignment = 3
        },
        --Row Characteristic textbox
        {
            pos       = {0.156,0.1,0.457},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Wys",
            value     = "",
            alignment = 3
        },
        --Row Advance textbox
        {
            pos       = {0.267,0.1,0.457},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Wys",
            value     = "",
            alignment = 3
        },
        --Row Skill textbox
        {
            pos       = {0.385,0.1,0.457},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Wys",
            value     = "",
            alignment = 3
        },
        --Stealth Characteristic textbox
        {
            pos       = {0.156,0.1,0.537},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Zas",
            value     = "",
            alignment = 3
        },
        --Stealth Advance textbox
        {
            pos       = {0.267,0.1,0.537},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Zas",
            value     = "",
            alignment = 3
        },
        --Stealth Skill textbox
        {
            pos       = {0.385,0.1,0.537},
            rows      = 1,
            width     = 430,
            font_size = 250,
            label     = "Zas",
            value     = "",
            alignment = 3
        },
        --GROUPED AND ADVANCED SKILLS
        --Name textbox
        {
            pos       = {0.705,0.1,0.032},
            rows      = 18,
            width     = 1800,
            font_size = 250,
            label     = "Nazwa umiejętności",
            value     = "",
            alignment = 2
        },
        --Characteristic 1
        {
            pos       = {0.980,0.1,0.032},
            rows      = 18,
            width     = 500,
            font_size = 250,
            label     = "ChN",
            value     = "",
            alignment = 3
        },
        --Characteristic 2
        {
            pos       = {1.115,0.1,0.032},
            rows      = 18,
            width     = 500,
            font_size = 250,
            label     = "ChV",
            value     = "",
            alignment = 3
        },
        --Advance
        {
            pos       = {1.228,0.1,0.032},
            rows      = 18,
            width     = 400,
            font_size = 250,
            label     = "Roz",
            value     = "",
            alignment = 3
        },
        --Skill
        {
            pos       = {1.347,0.1,0.032},
            rows      = 18,
            width     = 600,
            font_size = 250,
            label     = "Umiej",
            value     = "",
            alignment = 3
        },
        --TALENTS
        --Talent Name Textbox
        {
            pos       = {-1.189,0.1,1.394},
            rows      = 31,
            width     = 2100,
            font_size = 150,
            label     = "Nazwa talentu",
            value     = "",
            alignment = 2
        },
        --Talent Times Taken Textbox
        {
            pos       = {-0.861,0.1,1.394},
            rows      = 31,
            width     = 700,
            font_size = 150,
            label     = "Poziom talentu",
            value     = "",
            alignment = 3
        },
        --Talent Description Textbox
        {
            pos       = {-0.415,0.1,1.394},
            rows      = 31,
            width     = 3200,
            font_size = 150,
            label     = "Opis",
            value     = "",
            alignment = 2
        },
        --AMBITIONS
        --Ambitions Short Term Textbox
        {
            pos       = {0.9,0.1,0.84},
            rows      = 3,
            width     = 5000,
            font_size = 250,
            label     = "Ambicja krótkoterminowa",
            value     = "",
            alignment = 2
        },
        --Ambitions Long Term Textbox
        {
            pos       = {0.9,0.1,1.036},
            rows      = 3,
            width     = 5000,
            font_size = 250,
            label     = "Ambicja długoterminowa",
            value     = "",
            alignment = 2
        },
        --PARTY
        --Party Name Textbox
        {
            pos       = {0.89,0.1,1.353},
            rows      = 1,
            width     = 5500,
            font_size = 250,
            label     = "Nazwa Drużyny",
            value     = "",
            alignment = 2
        },
        --Party Short Term Ambitions Textbox
        {
            pos       = {0.9,0.1,1.49},
            rows      = 3,
            width     = 4900,
            font_size = 250,
            label     = "Ambicja drużynowa krótkoterminowa",
            value     = "",
            alignment = 2
        },
        --Party Long Term Ambitions Textbox
        {
            pos       = {0.9,0.1,1.68},
            rows      = 3,
            width     = 4900,
            font_size = 250,
            label     = "Ambicja drużynowa długoterminowa",
            value     = "",
            alignment = 2
        },
        --Party Members Textbox
        {
            pos       = {0.9,0.1,1.842},
            rows      = 2,
            width     = 4900,
            font_size = 250,
            label     = "Członkowie drużyny",
            value     = "",
            alignment = 2
        }
        --End of textboxes
    }
}

attributeNames = {"WW", "US", "S", "Wt", "I", "Zw", "Zr", "Int", "SW", "Ogd"}
skillNames = {
    "Atl", "BBP", "BBD", "Ch", "Dow", "Haz", "In", "Jeź", "MG", "Naw", "Odp", 
    "Opa", "Osw", "Per", "Plot", "Pow", "Przek", "Skr", "Szt", "Przet", "Targ", "Uni", "Wio", "Wsp", "Wys", "Zas"
}
skillsMapping = {
    WW={"BBP", "BBD"},
    S={"Wio", "Wsp", "Zas"},
    Wt={"MG", "Odp"},
    I={"In", "Naw", "Per"},
    Zw={"Atl", "Jeź", "Pow", "Skr", "Uni"},
    Zr={"Szt"},
    Int={"Haz", "Przet"},
    SW={"Opa", "Osw"},
    Ogd={"Ch", "Dow", "Plot", "Przek", "Targ", "Wys"},
}