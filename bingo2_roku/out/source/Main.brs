sub Main()
    print "in showChannelSGScreen"
    'Indicate this is a Roku SceneGraph application'
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    'Create a scene and load /components/bingoscreen.xml'
    scene = screen.CreateScene("BingoScreen")
    screen.show()

    while(true)
    end while
end sub


'//# sourceMappingURL=./Main.brs.map