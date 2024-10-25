sub Main()
    print "in showChannelSGScreen"
    'Indicate this is a Roku SceneGraph application'
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    gameID = RND(1000000 - 100000) + 100000
    ' print gameID

    'Create a scene and load /components/bingoscreen.xml'
    scene = screen.CreateScene("BingoScene")
    
    screen.show()
    scene.gameID = gameID
    print scene.gameID

    while(true)
    end while
end sub

