sub init()
    m.background = m.top.findNode("background")
    m.popupLabel = m.top.findNode("patternLabel")
    m.cancelButton = m.top.findNode("cancelButton")
end sub

function dismissPopup()
    m.top.visible = false
end function