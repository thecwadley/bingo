sub init()
    m.Top.backgroundURI = ""
    m.top.backgroundColor = "0xFFFFFFFF"
    m.top.setFocus(true)

    m.gettingCode = false
    m.code = ""

    m.prev2 = m.top.findNode("prev2")
    m.prev1 = m.top.findNode("prev1")
    m.prev0 = m.top.findNode("prev0")
    m.gameID = m.top.findNode("gameID")

    ' Set the font size
    m.prev2.font.size=75
    m.prev1.font.size=75
    m.prev0.font.size=150
    m.gameID.font.size=25

    ' Set the text color
    m.prev2.color="0x000000FF"
    m.prev1.color="0x000000FF"
    m.prev0.color="0x000000FF"
    m.gameID.color="0x7f7f7fFF"

    ' Set the text position
    m.prev2.translation = [0, 100]
    m.prev1.translation = [0, 190]
    m.prev0.translation = [0, 325]
    m.gameID.translation = [450, 600]

    m.gameID.text = ""

    m.bingoRepository = CreateObject("roSGNode", "BingoRepository")
    m.bingoRepository.ObserveField("bingo", "update")
    m.bingoRepository.ObserveField("gameID", "setGameID")
    m.bingoRepository.ObserveField("status", "setGameID")
    m.bingoRepository.control = "RUN"

    m.bingo = Bingo()
    m.bingoRepository.bingo = {
        "numbers": m.bingo.numbers,
        "index": m.bingo.index
    }
end sub

function setGameID()
    if m.bingoRepository.status = "limbo"
        m.gameID.text = "Connecting..."
    else if m.bingoRepository.gameID <> ""
        m.gameID.text = "Connected!"
    else
        m.gameID.text = "Connection Error, link ended :("
    end if
end function

function update()
    m.bingo = Bingo(m.bingoRepository.bingo)
    m.prev0.text = m.bingo.prev0
    m.prev1.text = m.bingo.prev1
    m.prev2.text = m.bingo.prev2
end function

function displayPairingPopup()
    m.popupDialog = CreateObject("roSGNode", "PopupDialog")
    m.top.appendChild(m.popupDialog)
    m.popupDialog.visible = true
    m.patternLabel = m.top.findNode("patternLabel")
    m.popupLabel = m.top.findNode("popupLabel")
end function

function readSettings(key, press)
    if (key = "OK" or key = "down") and m.bingo.indexIsValid(m.bingo.index + 1)
        m.bingoRepository.bingo = {
            "numbers": m.bingo.numbers,
            "index": m.bingo.index + 1
        }
        return true
    else if key = "up" and m.bingo.indexIsValid(m.bingo.index - 1)
        m.bingoRepository.bingo = {
            "numbers": m.bingo.numbers,
            "index": m.bingo.index - 1
        }
        return true
    else if key = "replay"
        m.bingo = Bingo()
        m.bingoRepository.bingo = {
            "numbers": m.bingo.numbers,
            "index": m.bingo.index
        }
        return true
    else if key = "options"
        if m.bingoRepository.status = "limbo"
            m.bingoRepository.gameID = ""
            m.bingoRepository.status = ""
        end if
        m.gettingCode = true
        displayPairingPopup()
        return true
    endif
    return false
end function

function closePopup()
    m.patternLabel.text = ""
    m.top.removeChild(m.popupDialog)
    m.popupDialog = invalid
    m.patternLabel = invalid
    m.popupLabel = invalid
    m.gettingCode = false
    m.code = ""
end function

function readKnockCode(key, press)
    handled = false
    
    if key = "left"
        m.patternLabel.text = m.patternLabel.text + "L"
        m.code = m.code + "0"
        handled = true
    else if key = "up"
        m.patternLabel.text = m.patternLabel.text + "U"
        m.code = m.code + "1"
        handled = true
    else if key = "right"
        m.patternLabel.text = m.patternLabel.text + "R"
        m.code = m.code + "2"
        handled = true
    else if key = "down"
        m.patternLabel.text = m.patternLabel.text + "D"
        m.code = m.code + "3"
        handled = true

    else if key = "back"
        closePopup()
        handled = true
    else if key = "replay"
        m.patternLabel.text = ""
        m.code = ""
        handled = true

    else if key = "OK" and len(m.code) < 8
        m.popupLabel.text = "Oops, too short!"
        m.code = ""
        handled = true
    else if key = "OK" and len(m.code) = 8
        m.bingoRepository.gameID = m.code
        closePopup()
        handled = true
    end if

    if m.popupDialog <> invalid and len(m.patternLabel.text) > 8
        startingIndex = len(m.patternLabel.text) - 8
        endingIndex = len(m.patternLabel.text) - 1
        m.patternLabel.text = m.patternLabel.text.mid(startingIndex, endingIndex)
        m.code = m.code.mid(startingIndex, endingIndex)
    end if

    return handled
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press = false
        return false
    end if
    if m.gettingCode = false
        return readSettings(key, press)
    else
        return readKnockCode(key, press)
    endif
    return false
end function