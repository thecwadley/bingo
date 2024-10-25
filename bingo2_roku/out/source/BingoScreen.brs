'import "../source/BingoGame.bs"

function init()
    m.Top.backgroundURI = ""
    m.top.backgroundColor = "0xFFFFFFFF"
    m.top.setFocus(true)
    m.prev2 = m.top.findNode("prev2")
    m.prev1 = m.top.findNode("prev1")
    m.current = m.top.findNode("current")
    ' Set the font size
    m.prev2.font.size = 75
    m.prev1.font.size = 75
    m.current.font.size = 150
    ' Set the text color
    m.prev2.color = "0x000000FF"
    m.prev1.color = "0x000000FF"
    m.current.color = "0x000000FF"
    ' Set the text position
    m.prev2.translation = [
        0
        100
    ]
    m.prev1.translation = [
        0
        190
    ]
    m.current.translation = [
        0
        325
    ]
    ' Create and start the bingo game
    m.bingo = BingoGame()
    m.bingo.initialize()
    setText()
end function

function setText()
    m.current.text = m.bingo.getBingoValue(0)
    m.prev1.text = m.bingo.getBingoValue(1)
    m.prev2.text = m.bingo.getBingoValue(2)
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    print key
    if (key = "OK" or key = "down") and press = false
        m.bingo.nextNumber()
        setText()
        return true
    else if key = "up" and press = false
        m.bingo.prevNumber()
        setText()
        return true
    else if key = "replay" and press = false
        m.bingo.initialize()
        setText()
    endif
    return false
end function
'//# sourceMappingURL=./BingoScreen.brs.map