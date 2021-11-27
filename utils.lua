buttonScale = {0.1,0.1,0.1}
buttonScaleToDisable = {-0.1, 0.1, 0.1}
rotationToDisable = {x=180, y=180, z=0}
standardRotation = {x=0, y=0, z=0}

function setContains(set, key)
    return set[key] ~= nil
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function getValueIfNull(val, default)
    local ret = val
    if val == nil or not val or val == "" then
        ret = default
    end
    return ret
end

function getNumberFromValueWithFallback(val, default)
    local val = getValueIfNull(val, default)
    return string.match(val, "%d+")
end

function getFirstPlayerSelectingObject(inputObject)
    local playersInfo = inputObject.getSelectingPlayers() 
    playerInfo = playersInfo[1]
    for _, playerObject in ipairs(Player.getPlayers()) do
        if playerObject.color == playerInfo then
            return playerObject
        end
    end
end

function getOtherObjectSelectedByPlayer(firstObject, playerObject)
    
    local selectedObjects = playerObject.getSelectedObjects()
    for _, selectedObject in ipairs(selectedObjects) do
        if selectedObject ~= firstObject then
            return selectedObject
        end
    end
end

function findInputByLabel(inputsTable, labelToFind)
    for inputTableIndex, inputTable in ipairs(inputsTable) do
        if inputTable.label == labelToFind then
            return inputTable
        end
    end
end

function changeInputValueAndSaveToRefButtonData(inputIndex, value, ref_buttonData)
    -- NOTE: inputIndex is meant to be inputIndex as per TTS convention (0-based)
    ref_buttonData.textbox[inputIndex+1].value = value
    self.editInput({index=inputIndex, value=tostring(value)})
end

function toggleLock(currentLockState, inputsTable, currentObject) 
    local lockState = not (currentLockState)
    for inputTableIndex, inputTable in ipairs(inputsTable) do
        if lockState then
            currentObject.editInput({
                index=inputTable.index,
                rotation = rotationToDisable,
                scale = buttonScaleToDisable
            })
        else
            currentObject.editInput({
                index=inputTable.index,
                rotation = standardRotation,
                scale = buttonScale
            })
        end
    end
    return lockState
end